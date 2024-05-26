import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:survey_frontend/presentation/tab_views/archived_surveys_tab_view.dart';
import 'package:survey_frontend/presentation/tab_views/pendning_surveys_tab_view.dart';
import 'package:survey_frontend/presentation/tab_views/respondent_data_tab_view.dart';
import 'package:survey_frontend/presentation/tab_views/survey_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget{
  
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  Timer? timer;
  int hours = 5;
  int minutes = 13;
  
  _HomeScreenState();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
            Text(
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTimeCard(hours, 'Godzin'),
                SizedBox(width: 40),
                _buildTimeCard(minutes, 'Minut'),
              ],
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  _buildSurveyButton(),
                  SizedBox(height: 10),
                  _buildSurveyButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeCard(int time, String unit) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: time / (unit == 'Godzin' ? 24 : 60),
            strokeWidth: 8,
            backgroundColor: Color.fromARGB(117, 166, 214, 35),
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF75A100)),
            strokeCap: StrokeCap.round,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time.toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              unit,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSurveyButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Card(
        color: Color(0xFFFCB040),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
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
            color: Color(0xFFCE7B00), // Ensure the bell icon is white
          ),
          title: Text(
            'Ankieta',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
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
