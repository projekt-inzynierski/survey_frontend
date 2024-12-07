import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/app_styles.dart';
import 'package:survey_frontend/presentation/controllers/privacy_settings_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacySettingsScreen extends GetView<PrivacySettingsController> {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppStyles.backgroundSecondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.privacy,
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
              color: AppStyles.backgroundSecondary,
              child: Column(children: [
                Obx(() => Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.allowTrackLocation,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Switch(
                              value: controller.enableTrackingLocation.value,
                              onChanged: (v) {
                                controller.enableTrackingLocation.value = v;
                              })
                        ],
                      ),
                    )),
                    const SizedBox(height: 10), 
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 10),
                GFTimePicker(
                  
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
