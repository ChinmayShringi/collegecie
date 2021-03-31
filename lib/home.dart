import 'package:clg/Player.dart';
import 'package:clg/lock.dart';
import 'package:clg/made.dart';
import 'package:clg/map.dart';
import 'package:clg/music.dart';
import 'package:clg/qrp.dart';
import 'package:clg/stt.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' show utf8;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complex Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Complex Music Player'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static AudioCache cache = AudioCache();
  AudioPlayer player;

  bool isPlaying = false;
  bool isPaused = false;

  void playHandler() async {
    if (isPlaying) {
      player.stop();
    } else {
      player = await cache.play('audio/abc.mp3');
    }

    setState(() {
      if (isPaused) {
        isPlaying = false;
        isPaused = false;
      } else {
        isPlaying = !isPlaying;
      }
    });
  }

  void pauseHandler() {
    if (isPaused && isPlaying) {
      player.resume();
    } else {
      player.pause();
    }
    setState(() {
      isPaused = !isPaused;
    });
  }

  String result = "Hey there !";
  bool descTextShowFlag = false;
  Timer search;
  static final _possibleFormats = BarcodeFormat.values.toList();
  List<BarcodeFormat> selectedFormats = [..._possibleFormats];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome To Complex Search!',
              style: TextStyle(fontSize: 21),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              //     disabledColor: Colors.red,
              // disabledTextColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => STPage()),
                );
              },
              child: Text('Search Via Speech!'),
            ),
            ElevatedButton(
              //     disabledColor: Colors.red,
              // disabledTextColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LockPage()),
                );
              },
              child: Text('Local Auth'),
            ),
            ElevatedButton(
              //     disabledColor: Colors.red,
              // disabledTextColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TTSPage()),
                );
              },
              child: Text('Want to hear my voice?'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              },
              child: Text('Check Out The Map!'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PlayerButton(
                  onPressed: playHandler,
                  isTrue: isPlaying,
                  trueText: "Stop",
                  falseText: "Play",
                ),
                isPlaying
                    ? PlayerButton(
                        onPressed: isPlaying ? pauseHandler : null,
                        isTrue: isPaused,
                        trueText: "Resume",
                        falseText: "Pause",
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$result...',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanQR,
        child: Icon(Icons.camera_alt),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future _scanQR() async {
    var options = ScanOptions(
      restrictFormat: selectedFormats,
    );
    try {
      var qrResult = await BarcodeScanner.scan(options: options);
      setState(() {
        result = qrResult.rawContent;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }
}

class PlayerButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isTrue;
  final String trueText;
  final String falseText;

  PlayerButton({
    @required this.onPressed,
    @required this.isTrue,
    @required this.trueText,
    @required this.falseText,
  });

  @override
  _PlayerButtonState createState() => _PlayerButtonState();
}

class _PlayerButtonState extends State<PlayerButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(widget.isTrue ? widget.trueText : widget.falseText,
          style: TextStyle(fontSize: 20)),
    );
  }
}
