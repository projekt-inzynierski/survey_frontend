import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SurveyTile extends StatelessWidget {
  final String surveyTitle;
  final void Function() onPressed;

  const SurveyTile(
      {super.key, required this.surveyTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Card(
        color: const Color(0xFFFCB040),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(0xFFE6A648),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          trailing: SvgPicture.asset(
            'assets/bell.svg',
            height: 32, // Adjust the height as needed
            colorFilter:
                const ColorFilter.mode(Color(0xFFCE7B00), BlendMode.srcIn),
          ),
          title: Text(
            surveyTitle,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            overflow: TextOverflow.ellipsis,
            'Szczegóły ankiety',
            style: TextStyle(color: Colors.white70),
          ),
          onTap: onPressed,
        ),
      ),
    );
  }
}
