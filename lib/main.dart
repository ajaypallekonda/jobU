import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/internship.dart';

void main() {
  List<Internship> parseInternships(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Internship>((json) => Internship.fromJson(json)).toList();
  }

  Future<List<Internship>> fetchInternships() async {
    final response =
        await http.get('http://192.168.198.1:8000/internships.json');
    if (response.statusCode == 200) {
      return parseInternships(response.body);
    } else {
      throw Exception('Unable to fetch internships from the REST API');
    }
  } // This widget is the root of your application.

  runApp(MyApp(
    internships: fetchInternships(),
  ));
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
