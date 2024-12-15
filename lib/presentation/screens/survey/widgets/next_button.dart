import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback nextAction;
  final String text;
  const NextButton({super.key, required this.nextAction, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -5))
      ]),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              nextAction();
            },
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
