import 'package:clg/Player.dart';
import 'package:clg/home.dart';
import 'package:clg/lock.dart';
import 'package:clg/made.dart';
import 'package:clg/map.dart';
import 'package:clg/music.dart';
import 'package:clg/stt.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complex Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Complex Music Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.code,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Coders()),
              );
            },
          )
        ],
        title: Text(widget.title),
      ),
        // body: LockPage() // This trailing comma makes auto-formatting nicer for build methods.
        body: HomePage() // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
