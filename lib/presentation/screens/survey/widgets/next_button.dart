import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback nextAction;
  final String text;
  const NextButton({super.key, required this.nextAction, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          nextAction();
        },
        child: Text(text),
      ),
    );
  }
}
