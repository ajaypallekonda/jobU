import 'package:flutter/material.dart';

class InternTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text("Company Name"),
        subtitle: Container(
          child: Text("Internship Title"),
        ));
  }
}
