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
            backgroundColor: Theme.of(context).primaryColorLight,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColorDark),
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
