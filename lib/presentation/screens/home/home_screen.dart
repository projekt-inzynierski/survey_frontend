import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:survey_frontend/presentation/controllers/home_controller.dart';
import 'package:survey_frontend/presentation/screens/home/widgets/time_circle.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/profile_circle.svg',
                height: 24, // Adjust the height as needed
              ),
              onPressed: () {
                // Define the action when the user icon is pressed
              },
            ),
            const Text(
              'UrBEaT',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/settings_circle.svg',
                height: 24, // Adjust the height as needed
              ),
              onPressed: () {
                // Define the action when the settings icon is pressed
              },
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Pozostały czas do kolejnej planowej ankiety',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => TimeCircle(
                    time: controller.hours.value,
                    unit: 'Godzin',
                    timeUnit: 24)),
                const SizedBox(width: 40),
                Obx(() => TimeCircle(
                    time: controller.minutes.value,
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
    return Obx(() => ListView.builder(
          itemCount: controller.pendingSurveys.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0), // Add padding here
              child: _buildSurveyButton(controller.pendingSurveys[index]),
            );
          },
        ));
  }

  Widget _buildSurveyButton(String surveyTitle) {
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
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            'Szczegóły ankiety',
            style: TextStyle(color: Colors.white70),
          ),
          onTap: () {
            // Define the action when the button is pressed
          },
        ),
      ),
    );
  }
}
