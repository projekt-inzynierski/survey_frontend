import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/home_controller.dart';
import 'package:survey_frontend/presentation/screens/home/widgets/survey_tile.dart';
import 'package:survey_frontend/presentation/screens/home/widgets/time_circle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends GetView<HomeController>
implements RouteAware {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadShortSurveys();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/profile_circle.svg',
            height: 24,
          ),
          onPressed: () {
            // Define the action when the user icon is pressed
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
              // Define the action when the settings icon is pressed
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
                    unit: 'Godzin',
                    timeUnit: 24)),
                const SizedBox(width: 40),
                Obx(() => TimeCircle(
                    time: controller.minutesLeft(),
                    unit: 'Minut',
                    timeUnit: 60)),
              ],
            ),
            const SizedBox(height: 40),
            Expanded(child: _buildSurveyList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSurveyList() {
    return Obx(() => RefreshIndicator(
      onRefresh: controller.loadShortSurveys,
      child: ListView.builder(
            itemCount: controller.pendingSurveys.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0),
                child: SurveyTile(
                    surveyTitle: controller.pendingSurveys[index].name,
                    onPressed: () {
                      controller.startCompletingSurvey(controller.pendingSurveys[index].id);
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
    controller.loadShortSurveys();
  }
  
  @override
  void didPushNext() {
    controller.loadShortSurveys();
  }
}
