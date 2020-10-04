import 'package:flutter/material.dart';
import 'package:jobU/widgets/internship_tile.dart';
import 'package:jobU/models/internship.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  // final List<Product> items;
  //  ProductBoxList({Key key, this.items});

  Home({Key key, this.title}) : super(key: key);

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
        title: Text(widget.title,
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
        child: Icon(Icons.add),
      ),
      body: //StreamBuilder(
          //   builder: (content, snapshot){
          //     if (snapshot.hasData && snapshot.data.documents != null && snapshot.data.documents.length > 0){
          //       return ListView.builder(
          //         itemCount: snapshot.data.documents.length,
          //         itemBuilder: null,

          //         );
          //     }
          //   })
          ListView(
        children: [
          InternTile(),
          InternTile(),
          InternTile(),
          InternTile(),
          InternTile(),
        ],
      ),
    );
    ;
  }
}
