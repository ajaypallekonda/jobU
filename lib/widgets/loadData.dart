import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobU/models/internship.dart';
import 'dart:async';
import 'dart:convert';
import 'package:jobU/main.dart';

class LoadData extends StatefulWidget {
  @override
  _LoadDataState createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  @override
  Widget build(BuildContext context) {
    return MyApp(internships: fetchInternships());
  }

  List<Internship> parseInternships(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Internship>((json) => Internship.fromJson(json)).toList();
  }

  Future<List<Internship>> fetchInternships() async {
    final response = await http
        .get('http://10.0.2.2:5000/', headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      return parseInternships(response.body);
    } else {
      throw Exception('Unable to fetch internships from the REST API');
    }
  }
}
