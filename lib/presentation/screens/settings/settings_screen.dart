import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/settings_controller.dart';
import 'package:survey_frontend/presentation/screens/settings/widgets/nav_item.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});
  final Color settingsBackgroundColor =
      const Color.fromARGB(173, 214, 236, 154);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 60),
          Container(
            decoration: BoxDecoration(
              color: settingsBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 24),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 22,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: settingsBackgroundColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.appSettings,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  NavItem(
                    icon: Icons.thermostat,
                    label: AppLocalizations.of(context)!.editSensor,
                    onTap: controller.editSensor,
                    iconColor: Colors.black,
                  ),
                   NavItem(
                    icon: Icons.lock_open,
                    label: AppLocalizations.of(context)!.logout,
                    onTap: controller.logout,
                    iconColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
