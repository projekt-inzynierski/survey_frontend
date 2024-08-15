import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            blurRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).hintColor,
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
                ColorFilter.mode(
                Theme.of(context).highlightColor, BlendMode.srcIn),
          ),
          title: Text(
            surveyTitle,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            overflow: TextOverflow.ellipsis,
            AppLocalizations.of(context)!.surveyDetails,
            style: const TextStyle(color: Colors.white70),
          ),
          onTap: onPressed,
        ),
      ),
    );
  }
}
