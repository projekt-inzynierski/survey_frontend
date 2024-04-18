import 'package:flutter/material.dart';

class SurveyTab extends StatelessWidget {
  final String label;
  final IconData iconData;

  const SurveyTab({super.key, required this.label, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(iconData),
      child: FittedBox(child: Text(label)),
    );
  }
}
