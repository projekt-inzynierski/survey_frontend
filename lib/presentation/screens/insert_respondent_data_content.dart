import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class InsertRespondentDataContent extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onPressed;
  final List<Widget> children;

  const InsertRespondentDataContent({super.key, 
  required this.formKey,
  required this.onPressed,
  required this.children});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Pusty kontener, aby uzyskać odstęp między AppBar a kolumną
            SizedBox(height: MediaQuery.of(context).padding.top), 

            // Kolumna z formularzem lub innymi widgetami
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.only(bottom: 50.0,
      left: 25, right: 25),
      child: ElevatedButton(
        onPressed: onPressed,
          child: Text(AppLocalizations.of(context)!.next),
      ),
    ),
  );
}
}