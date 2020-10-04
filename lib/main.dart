import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/internship.dart';

void main() {
  runApp(MyApp());
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
