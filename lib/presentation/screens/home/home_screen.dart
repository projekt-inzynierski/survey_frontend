import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:survey_frontend/l10n/get_localizations.dart';
import 'package:survey_frontend/presentation/controllers/home_controller.dart';
import 'package:survey_frontend/presentation/screens/home/widgets/survey_tile.dart';
import 'package:survey_frontend/presentation/screens/home/widgets/time_circle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends GetView<HomeController> implements RouteAware {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadSurveys();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/profile_circle.svg',
            height: 24,
          ),
          onPressed: () {
            controller.openProfile();
          },
        ),
        centerTitle: true,
        title: const Text(
          'UrBEaT',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/settings_circle.svg',
              height: 24,
            ),
            onPressed: () {
              controller.openSettings();
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.nextSurveyTime,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => TimeCircle(
                    time: controller.hoursLeft(),
                    unit: AppLocalizations.of(context)!.hours,
                    timeUnit: 24)),
                const SizedBox(width: 40),
                Obx(() => TimeCircle(
                    time: controller.minutesLeft(),
                    unit: AppLocalizations.of(context)!.minutes,
                    timeUnit: 60)),
              ],
            ),
            const SizedBox(height: 40),
            Expanded(child: _buildSurveyList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.isLocationWorking();
        },
        child: const Icon(Icons.location_pin),
      ),
    );
  }

  Widget _buildSurveyList() {
    return Obx(() => RefreshIndicator(
          onRefresh: controller.loadSurveys,
          child: ListView.builder(
            itemCount: controller.pendingSurveys.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: SurveyTile(
                    surveyTitle: controller.pendingSurveys[index].name,
                    onPressed: () {
                      controller.startCompletingSurvey(
                          controller.pendingSurveys[index].id);
                    }),
              );
            },
          ),
        ));
  }

  @override
  void didPop() {
    return;
  }

  @override
  void didPopNext() {
    return;
  }

  @override
  void didPush() {
    controller.loadSurveys();
  }

  @override
  void didPushNext() {
    controller.loadSurveys();
  }
}
