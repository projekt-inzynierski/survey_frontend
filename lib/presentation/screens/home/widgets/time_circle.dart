import 'package:flutter/material.dart';

class TimeCircle extends StatelessWidget {
  final int time;
  final String unit;
  final int timeUnit;
  const TimeCircle(
      {super.key,
      required this.time,
      required this.unit,
      required this.timeUnit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: time / timeUnit,
            strokeWidth: 8,
            backgroundColor: const Color.fromARGB(117, 166, 214, 35),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF75A100)),
            strokeCap: StrokeCap.round,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time.toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              unit,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
