import 'package:flutter/material.dart';
import 'package:jobU/widgets/internship_tile.dart';
import 'package:jobU/models/internship.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobU/widgets/internship_tile.dart';

class Home extends StatelessWidget {
  final Future<List<Internship>> internships;

  Home({Key key, this.title, this.internships}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(this.title,
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
            print("pressed");
          },
          tooltip: 'Increment',
          child: Icon(Icons.replay_outlined),
        ),
        body: Center(
          child: FutureBuilder<List<Internship>>(
            future: internships,
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
