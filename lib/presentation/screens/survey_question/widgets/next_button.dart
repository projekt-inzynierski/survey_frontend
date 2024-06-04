import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback nextQuestion;
  const NextButton({super.key, required this.nextQuestion});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          nextQuestion();
        },
        child: const Text('Dalej'),
      ),
    );
  }
}
