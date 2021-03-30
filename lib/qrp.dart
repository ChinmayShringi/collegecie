import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' show utf8;
import 'package:flutter/services.dart' show rootBundle;

class QRPage extends StatefulWidget {
  @override
  _QRPageState createState() => _QRPageState();
}


class _QRPageState extends State<QRPage> {
  String result = "Hey there !";
  bool descTextShowFlag = false;
  Timer search;
  static final _possibleFormats = BarcodeFormat.values.toList();
  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('asd')
              ],
            ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanQR,
        tooltip: 'Scan',
        child: Icon(Icons.camera_alt),
      ),
    );
  }



}

