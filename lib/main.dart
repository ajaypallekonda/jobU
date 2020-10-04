import 'package:flutter/material.dart';
import 'package:jobU/widgets/loadData.dart';
import 'screens/home.dart';
import 'dart:async';
import 'models/internship.dart';

void main() {
  runApp(LoadData());
}

class MyApp extends StatelessWidget {
  final Future<List<Internship>> internships;
  MyApp({Key key, this.internships}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'jobU.',
      theme: ThemeData.light(),
      home: Home(
        title: "jobU.",
        internships: internships,
      ),
    );
  }
}
