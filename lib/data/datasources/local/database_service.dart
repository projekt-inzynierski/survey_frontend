import 'dart:io';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:survey_frontend/data/models/short_survey.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';
import 'package:survey_frontend/domain/models/survey_with_time_slots.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  final GetStorage _storage = Get.find();

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'survey_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE timeSlots (
        id TEXT PRIMARY KEY,
        surveyId TEXT,
        start DATETIME,
        finish DATETIME,
        rowVersion INTEGER,
        FOREIGN KEY (surveyId) REFERENCES surveys (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE surveys (
        id TEXT PRIMARY KEY,
        name TEXT,
        rowVersion INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE sections (
        id TEXT PRIMARY KEY,
        surveyId TEXT,
        "order" INTEGER,
        name TEXT,
        visibility TEXT,
        groupId TEXT,
        rowVersion INTEGER,
        displayOnOneScreen BIT,
        FOREIGN KEY (surveyId) REFERENCES surveys (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE questions (
        id TEXT PRIMARY KEY,
        sectionId TEXT,
        "order" INTEGER,
        content TEXT,
        questionType TEXT,
        required INTEGER,
        rowVersion INTEGER,
        FOREIGN KEY (sectionId) REFERENCES sections (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE options (
        id TEXT PRIMARY KEY,
        questionId TEXT,
        "order" INTEGER,
        label TEXT,
        showSection INTEGER,
        rowVersion INTEGER,
        imagePath TEXT,
        FOREIGN KEY (questionId) REFERENCES questions (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE number_ranges (
        id TEXT PRIMARY KEY,
        questionId TEXT,
        "from" INTEGER,
        "to" INTEGER,
        fromLabel TEXT,
        toLabel TEXT,
        rowVersion INTEGER
      )
    ''');
  }

  Future<void> upsertSurveys(
      List<SurveyWithTimeSlots> surveysWithTimeSlots) async {
    final db = await database;
    int maxRowVersion = 0;
    await db.transaction((txn) async {
      for (var surveyWithTimeSlots in surveysWithTimeSlots) {
        await txn.insert(
          'surveys',
          {
            'id': surveyWithTimeSlots.survey.id,
            'name': surveyWithTimeSlots.survey.name,
            'rowVersion': surveyWithTimeSlots.survey.rowVersion,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        maxRowVersion =
            max(maxRowVersion, surveyWithTimeSlots.survey.rowVersion);

        for (var timeSlot in surveyWithTimeSlots.surveySendingPolicyTimes) {
          await txn.insert(
              'timeSlots',
              {
                'id': timeSlot.id,
                'surveyId': surveyWithTimeSlots.survey.id,
                'start': timeSlot.start.toIso8601String(),
                'finish': timeSlot.finish.toIso8601String(),
                'rowVersion': timeSlot.rowVersion
              },
              conflictAlgorithm: ConflictAlgorithm.replace);

          maxRowVersion = max(maxRowVersion, timeSlot.rowVersion ?? 0);
        }

        for (var section in surveyWithTimeSlots.survey.sections) {
          await txn.insert(
            'sections',
            {
              'id': section.id,
              'surveyId': surveyWithTimeSlots.survey.id,
              'order': section.order,
              'name': section.name,
              'visibility': section.visibility,
              'groupId': section.groupId,
              'rowVersion': section.rowVersion,
              'displayOnOneScreen': section.displayOnOneScreen
            },
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
          maxRowVersion = max(maxRowVersion, section.rowVersion);

          for (var question in section.questions) {
            await txn.insert(
              'questions',
              {
                'id': question.id,
                'sectionId': section.id,
                'order': question.order,
                'content': question.content,
                'questionType': question.questionType,
                'required': question.required ? 1 : 0,
                'rowVersion': question.rowVersion,
              },
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
            maxRowVersion = max(maxRowVersion, question.rowVersion);

            if (question.options != null) {
              for (var option in question.options!) {
                await txn.insert(
                  'options',
                  {
                    'id': option.id,
                    'questionId': question.id,
                    'order': option.order,
                    'label': option.label,
                    'showSection': option.showSection,
                    'rowVersion': option.rowVersion,
                    'imagePath': option.imagePath
                  },
                  conflictAlgorithm: ConflictAlgorithm.replace,
                );
                maxRowVersion = max(maxRowVersion, option.rowVersion);
              }
            }

            if (question.numberRange != null) {
              await txn.insert(
                'number_ranges',
                {
                  'id': question.numberRange!.id,
                  'from': question.numberRange!.from,
                  'to': question.numberRange!.to,
                  'questionId': question.id,
                  'fromLabel': question.numberRange!.fromLabel,
                  'toLabel': question.numberRange!.toLabel,
                  'rowVersion': question.numberRange!.rowVersion,
                },
                conflictAlgorithm: ConflictAlgorithm.replace,
              );
              maxRowVersion =
                  max(maxRowVersion, question.numberRange!.rowVersion);
            }
          }
        }
      }
    });
    _updateMaxRowVersion(maxRowVersion);
  }

  bool _updateMaxRowVersion(int newRawVersion) {
    final currentMax = _storage.read<int>('surveysRowVersion');
    var changed = false;

    if (currentMax == null || currentMax < newRawVersion) {
      changed = true;
      _storage.write('surveysRowVersion', newRawVersion);
    }
    return changed;
  }

  Future<List<SurveyShortInfo>> getSurveysCompletableNow() async {
    final db = await database;
    final String currentDate = DateTime.now().toUtc().toIso8601String();
    final List<Map<String, dynamic>> surveyMaps = await db.rawQuery('''
        SELECT 
        surveys.id,
        surveys.name,
        timeSlots.start,
        timeSlots.finish
        FROM surveys
        JOIN timeSlots ON timeSlots.surveyId = surveys.id
        WHERE timeSlots.start < ? AND timeSlots.finish > ?
        ''', [currentDate, currentDate]);

    return surveyMaps.map((e) {
      return SurveyShortInfo(
          name: e['name'],
          id: e['id'],
          finishTime: DateTime.parse(e['finish']),
          startTime: DateTime.parse(e['start']));
    }).toList();
  }

  Future<List<SurveyShortInfo>> getFutureAndOngoingSurveys() async {
    final db = await database;
    final String currentDate = DateTime.now().toUtc().toIso8601String();
    final List<Map<String, dynamic>> surveyMaps = await db.rawQuery('''
        SELECT 
        surveys.id,
        surveys.name,
        timeSlots.start,
        timeSlots.finish
        FROM surveys
        JOIN timeSlots ON timeSlots.surveyId = surveys.id
        WHERE timeSlots.finish > ?
        ''', [currentDate]);

    return surveyMaps.map((e) {
      return SurveyShortInfo(
          name: e['name'],
          id: e['id'],
          finishTime: DateTime.parse(e['finish']),
          startTime: DateTime.parse(e['start']));
    }).toList();
  }

  Future removeSurveyTimeSlot(String id) async {
    final db = await database;
    final String currentDate = DateTime.now().toUtc().toIso8601String();
    await db.delete('timeSlots',
        where: 'surveyId = ? and start <= ? and finish >= ?',
        whereArgs: [id, currentDate, currentDate]);
  }

  Future<void> clearAllTables() async {
    final db = await database;
    await db.delete('timeSlots');
    await db.delete('surveys');
    await db.delete('sections');
    await db.delete('questions');
    await db.delete('options');
    await db.delete('number_ranges');
  }

  Future<void> clearTable(String tableName) async {
    final db = await database;
    await db.delete(tableName);
  }

  Future<SurveyDto> getSurveyById(String id) async {
    final db = await database;
    final Map<String, dynamic> surveyMap = Map.from((await db.rawQuery('''
      SELECT id, name, rowVersion
      FROM surveys
      WHERE id = ?
      ''', [id])).first);
    surveyMap['sections'] = await _getSections(id, db);

    return SurveyDto.fromJson(surveyMap);
  }

  Future<List<Map<String, dynamic>>> _getSections(
      String surveyId, Database db) async {
    final List<Map<String, dynamic>> sections = (await db.rawQuery('''
      SELECT id, "order", name, visibility, groupId, rowVersion, displayOnOneScreen
      FROM sections 
      WHERE surveyId = ?
      ''', [surveyId])).map((e) {
      final Map<String, dynamic> res = Map.from(e);
      return res;
    }).toList();

    final List<String> sectionsIds =
        sections.map((e) => e['id'] as String).toList();
    final questionsMap = await _getQuestionsToSectionMappings(sectionsIds, db);

    final questionsIds = questionsMap.values
        .expand((e) => e)
        .map((e) => e['id'] as String)
        .toList();
    final optionsMap = await _getOptionsToQuestionsMappings(questionsIds, db);
    final numberRangesMap =
        await _getNumberRangesToQuestionsMappings(questionsIds, db);

    for (final section in sections) {
      section['displayOnOneScreen'] = section['displayOnOneScreen'] == 1;
      section['questions'] = questionsMap[section['id']];

      for (final question in section['questions']) {
        question['required'] = question['required'] == 1;
        final questionId = question['id'];
        if (optionsMap.containsKey(questionId)) {
          question['options'] = optionsMap[questionId]!.toList();
        }

        if (numberRangesMap.containsKey(questionId)) {
          question['numberRange'] =
              numberRangesMap[questionId] as Map<String, dynamic>;
        }
      }
    }

    return sections;
  }

  Future<Map<String, List<Map<String, dynamic>>>>
      _getQuestionsToSectionMappings(
          List<String> sectionsIds, Database db) async {
    final List<Map<String, dynamic>> questions = (await db.rawQuery('''
      SELECT id, "order", content, questionType, required, rowVersion, sectionId
      FROM questions
      WHERE sectionId IN (${List.filled(sectionsIds.length, '?').join(', ')})
      ''', sectionsIds)).map((e) {
      final Map<String, dynamic> res = Map.from(e);
      return res;
    }).toList();

    return groupBy(questions, (map) => map['sectionId'] as String);
  }

  Future<Map<String, List<Map<String, dynamic>>>>
      _getOptionsToQuestionsMappings(
          List<String> questionsIds, Database db) async {
    final List<Map<String, dynamic>> options = (await db.rawQuery('''
      SELECT id, "order", label, showSection, rowVersion, imagePath, questionId
      FROM options
      WHERE questionId IN (${List.filled(questionsIds.length, '?').join(', ')})
      ''', questionsIds));

    return groupBy(options, (map) => map['questionId'] as String);
  }

  Future<Map<String, Map<String, dynamic>>> _getNumberRangesToQuestionsMappings(
      List<String> questionsIds, Database db) async {
    final List<Map<String, dynamic>> numberRanges = (await db.rawQuery('''
      SELECT id, "from", "to", fromLabel, toLabel, rowVersion, questionId
      FROM number_ranges
      WHERE questionId IN (${List.filled(questionsIds.length, '?').join(', ')})
      ''', questionsIds));

    return {for (var e in numberRanges) e['questionId']: e};
  }
}
