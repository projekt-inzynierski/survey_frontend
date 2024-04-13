import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:survey_frontend/presentation/tab_views/archived_surveys_tab_view.dart';
import 'package:survey_frontend/presentation/tab_views/pedning_surveys_tab_view.dart';
import 'package:survey_frontend/presentation/tab_views/respondent_data_tab_view.dart';

class HomeScreen extends StatefulWidget{
  
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeStreenState();
  }
}

class _HomeStreenState extends State<HomeScreen> with TickerProviderStateMixin{
  late TabController _tabController;
  
  _HomeStreenState();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(title: const Text("Home")),
      body: GFTabBarView(
        controller: _tabController,
        children: const [
          RespondentDataTabView(),
          PendingSurveysTabView(),
          ArchivedSurveysTabView()
        ]
      ),
      bottomNavigationBar: GFTabBar(
        controller: _tabController,
        length: 3,
        tabBarColor: Theme.of(context).primaryColor,
        labelColor: Theme.of(context).secondaryHeaderColor,
        unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
        indicatorColor: Theme.of(context).indicatorColor,
        tabs: const [
          Tab(
            icon: Icon(FontAwesomeIcons.user),
            child: FittedBox(
              child: Text("Repondent data")
              ),
          ),
          Tab(
            icon: Icon(FontAwesomeIcons.clipboardList),
            child: FittedBox(
              child: Text("Pending surveys")
              ),
          ),
          Tab(
            icon: Icon(FontAwesomeIcons.boxArchive),
            child: FittedBox(
              child: Text("Archive")
              ),
          ),
        ],
      )
    );
  }
}