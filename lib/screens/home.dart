import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jobU/widgets/internship_tile.dart';
import 'package:jobU/models/internship.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobU/widgets/internship_tile.dart';

class Home extends StatefulWidget {
  Future<List<Internship>> internships;

  Home({Key key, this.title, this.internships}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(this.widget.title,
              style: TextStyle(fontFamily: 'Collegiateheavy', fontSize: 35)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          elevation: 25,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              widget.internships = fetchInternships();
            });
          },
          tooltip: 'Refresh',
          child: Icon(Icons.replay_outlined),
        ),
        body: Center(
          child: FutureBuilder<List<Internship>>(
            future: widget.internships,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? InternshipList(items: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}

class InternshipList extends StatelessWidget {
  final List<Internship> items;
  InternshipList({Key key, this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: InternTile(item: items[index]),
        );
      },
    );
  }
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
