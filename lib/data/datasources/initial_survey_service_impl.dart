import 'package:survey_frontend/data/datasources/api_service_base.dart';
import 'package:survey_frontend/domain/external_services/api_response.dart';
import 'package:survey_frontend/domain/external_services/initial_survey_service.dart';
import 'package:survey_frontend/domain/models/initial_survey_question.dart';
import 'package:survey_frontend/domain/models/initial_survey_response.dart';

class InitialSurveyServiceImpl extends APIServiceBase implements InitialSurveyService {
  InitialSurveyServiceImpl(super.dio, {required super.tokenProvider});

  @override
  Future<APIResponse<List<InitialSurveyQuestion>>> getInitialSurvey() 
  //  => get<List<InitialSurveyQuestion>>('/api/qualityofsleep',  (dynamic items) => items.map<InitialSurveyQuestion>((e) => InitialSurveyQuestion.fromJson(e)).toList());
  {
    List<InitialSurveyQuestion> questions = [
    InitialSurveyQuestion(
      id: 'q1',
      order: 1,
      content: 'Jak często korzystasz z aplikacji mobilnych?',
      options: [
        InitialSurveyOption(id: 'o1', order: 1, content: 'Codziennie'),
        InitialSurveyOption(id: 'o2', order: 2, content: 'Kilka razy w tygodniu'),
        InitialSurveyOption(id: 'o3', order: 3, content: 'Rzadko'),
        InitialSurveyOption(id: 'o4', order: 4, content: 'Nigdy'),
      ],
    ),
    InitialSurveyQuestion(
      id: 'q2',
      order: 2,
      content: 'Co najbardziej cenisz w aplikacjach mobilnych?',
      options: [
        InitialSurveyOption(id: 'o1', order: 1, content: 'Łatwość użycia'),
        InitialSurveyOption(id: 'o2', order: 2, content: 'Funkcjonalność'),
        InitialSurveyOption(id: 'o3', order: 3, content: 'Wygląd'),
        InitialSurveyOption(id: 'o4', order: 4, content: 'Inne'),
      ],
    ),
    InitialSurveyQuestion(
      id: 'q3',
      order: 3,
      content: 'Jakie funkcje chciałbyś zobaczyć w przyszłych aplikacjach?',
      options: [
        InitialSurveyOption(id: 'o1', order: 1, content: 'Lepsza personalizacja'),
        InitialSurveyOption(id: 'o2', order: 2, content: 'Integracja z innymi aplikacjami'),
        InitialSurveyOption(id: 'o3', order: 3, content: 'Więcej opcji bezpieczeństwa'),
        InitialSurveyOption(id: 'o4', order: 4, content: 'Inne'),
      ],
    ),
    InitialSurveyQuestion(
      id: 'q4',
      order: 4,
      content: 'Jakie typy aplikacji są dla Ciebie najbardziej interesujące?',
      options: [
        InitialSurveyOption(id: 'o1', order: 1, content: 'Edukacyjne'),
        InitialSurveyOption(id: 'o2', order: 2, content: 'Rozrywkowe'),
        InitialSurveyOption(id: 'o3', order: 3, content: 'Użyteczne (np. zdrowie, produktywność)'),
        InitialSurveyOption(id: 'o4', order: 4, content: 'Inne'),
      ],
    ),
    InitialSurveyQuestion(
      id: 'q5',
      order: 5,
      content: 'Ile czasu dziennie spędzasz w aplikacjach mobilnych?',
      options: [
        InitialSurveyOption(id: 'o1', order: 1, content: 'Mniej niż 1 godzina'),
        InitialSurveyOption(id: 'o2', order: 2, content: '1-2 godziny'),
        InitialSurveyOption(id: 'o3', order: 3, content: '2-4 godziny'),
        InitialSurveyOption(id: 'o4', order: 4, content: 'Ponad 4 godziny'),
      ],
    ),
    InitialSurveyQuestion(
      id: 'q6',
      order: 6,
      content: 'Czy korzystasz z aplikacji do nauki?',
      options: [
        InitialSurveyOption(id: 'o1', order: 1, content: 'Tak, regularnie'),
        InitialSurveyOption(id: 'o2', order: 2, content: 'Czasami'),
        InitialSurveyOption(id: 'o3', order: 3, content: 'Nie, ale chciałbym spróbować'),
        InitialSurveyOption(id: 'o4', order: 4, content: 'Nie, nie interesuje mnie to'),
      ],
    ),
    InitialSurveyQuestion(
      id: 'q7',
      order: 7,
      content: 'Jak często aktualizujesz swoje aplikacje?',
      options: [
        InitialSurveyOption(id: 'o1', order: 1, content: 'Natychmiast po wydaniu aktualizacji'),
        InitialSurveyOption(id: 'o2', order: 2, content: 'Co kilka tygodni'),
        InitialSurveyOption(id: 'o3', order: 3, content: 'Rzadko'),
        InitialSurveyOption(id: 'o4', order: 4, content: 'Nigdy'),
      ],
    ),
    InitialSurveyQuestion(
      id: 'q8',
      order: 8,
      content: 'Jakie źródła informacji o aplikacjach są dla Ciebie najważniejsze?',
      options: [
        InitialSurveyOption(id: 'o1', order: 1, content: 'Recenzje w sklepach aplikacji'),
        InitialSurveyOption(id: 'o2', order: 2, content: 'Blogi i strony internetowe'),
        InitialSurveyOption(id: 'o3', order: 3, content: 'Zalecenia znajomych'),
        InitialSurveyOption(id: 'o4', order: 4, content: 'Media społecznościowe'),
      ],
    ),
    InitialSurveyQuestion(
      id: 'q9',
      order: 9,
      content: 'Jakie są Twoje największe obawy dotyczące aplikacji mobilnych?',
      options: [
        InitialSurveyOption(id: 'o1', order: 1, content: 'Prywatność danych'),
        InitialSurveyOption(id: 'o2', order: 2, content: 'Bezpieczeństwo'),
        InitialSurveyOption(id: 'o3', order: 3, content: 'Uzależnienie'),
        InitialSurveyOption(id: 'o4', order: 4, content: 'Inne'),
      ],
    ),
  ];
  return Future.value(APIResponse<List<InitialSurveyQuestion>>(statusCode: 200, body: questions));
  }
  
  @override
  Future<APIResponse> submit(InitialSurveyResponse response){
    return post('/api/respondents',  response.toJson());
  }
}