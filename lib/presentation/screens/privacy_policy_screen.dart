import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PrivacyPolicyScreen extends StatefulWidget{
  const PrivacyPolicyScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PrivacyPolicyScreenState();
  }

}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen>{
  String htmlContent = '';


  @override
  void initState() {
    super.initState();
    fetchHtmlContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Html(data: htmlContent)
    );
  }
  
  void fetchHtmlContent() async {
    try{
      final apiUrl = await GetStorage().read('apiUrl');
      final response = await http.get(Uri.parse(apiUrl + '/privacy-policy/pl.html'));
      if (response.statusCode == 200){
        setState(() {
          htmlContent = response.body;
        });
      }
    } catch (e){
      //TODO :log this error
    }
  }

}