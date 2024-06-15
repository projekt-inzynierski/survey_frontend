import 'package:survey_frontend/domain/models/create_question_answer_dto.dart';
import 'package:survey_frontend/domain/models/question_type.dart';

abstract class CreateQuestionAnswerDtoFactory{
    CreateQuestionAnswerDto getDto(String questionType);
}

class CreateQuestionAnswerDtoFactoryImpl implements CreateQuestionAnswerDtoFactory{
  @override
  CreateQuestionAnswerDto getDto(String questionType) {
    if (questionType == QuestionType.singleChoiceText){
      return CreateQuestionAnswerDto(selectedOptions: [
         CreateSelectedOptionDto()
      ]);
    }

    return CreateQuestionAnswerDto();
  }

}