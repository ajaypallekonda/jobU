import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobU/models/internship.dart';
import 'package:url_launcher/url_launcher.dart';

class InternTile extends StatelessWidget {
  InternTile({Key key, this.item}) : super(key: key);
  final Internship item;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: ListTile(
        title: Text(this.item.name),
        subtitle: Column(
            children: [Text(this.item.company), Text(this.item.location)]),
        onTap: () => launch(item.link),
      ),
    );
  }
}
