import 'package:flutter/material.dart';
import 'package:odc_formation/pages/activite/ActivitePage.dart';
import 'package:odc_formation/pages/activite/ParticipantList.dart';
import 'package:odc_formation/pages/auth/login_page.dart';
import 'package:odc_formation/pages/home/home.dart';
import 'package:odc_formation/pages/profile/profile.dart';


import 'NavBottom/NavBottom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
