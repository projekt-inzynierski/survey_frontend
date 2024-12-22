import 'package:flutter/material.dart';
import 'package:survey_frontend/domain/models/survey_dto.dart';

class SingleQuestion extends StatelessWidget {
  final Question question;
  final Widget Function(Question, int) questionWidgetBuilder;
  final String surveyName;
  final int questionIndex;
  final void Function()? onScrolledDown;

  const SingleQuestion(
      {super.key,
      required this.question,
      required this.questionWidgetBuilder,
      required this.surveyName,
      required this.questionIndex,
      this.onScrolledDown});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Center(
          child: Text(
            surveyName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Text(
            question.content,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
            child: _SingleQuestionScroll(
          question: question,
          questionWidgetBuilder: questionWidgetBuilder,
          questionIndex: questionIndex,
          onScrolledDown: onScrolledDown,
        ))
      ],
    );
  }
}

class _SingleQuestionScroll extends StatefulWidget {
  final Question question;
  final Widget Function(Question, int) questionWidgetBuilder;
  final int questionIndex;
  final void Function()? onScrolledDown;

  const _SingleQuestionScroll(
      {required this.question,
      required this.questionWidgetBuilder,
      required this.questionIndex,
      this.onScrolledDown});

  @override
  State<StatefulWidget> createState() {
    return _SingleQuestionScrollState();
  }
}

class _SingleQuestionScrollState extends State<_SingleQuestionScroll> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.position.maxScrollExtent == 0 &&
          widget.onScrolledDown != null) {
        widget.onScrolledDown!();
      }
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          widget.onScrolledDown != null) {
        widget.onScrolledDown!();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: _scrollController,
        child: widget.questionWidgetBuilder(
            widget.question, widget.questionIndex));
  }
}
