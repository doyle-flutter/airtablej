import 'package:flutter/material.dart';
import 'dart:async';
import 'package:airtablej/airtablej.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic> airTableData;
  bool netCheck;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async{
      final Airtablej _con = new Airtablej(
        key: "YOUR_API_KEY",
        tableName: "YOUR_TABLE_NAME",
      );
      this.netCheck = await _con.connect();
      if(this.netCheck) return print("Network Err !");
      setState(() {
        this.airTableData = _con.result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('JamesDev : AirTable Connect'),
        ),
        body: Center(
          child: this.netCheck == false
              ? Text("Network ERR!")
              : Text(this.airTableData ?? "loading ..."),
        ),
      ),
    );
  }
}
