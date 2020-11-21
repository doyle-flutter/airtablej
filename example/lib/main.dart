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
      final Airtablej air = new Airtablej(
        key: "YOUR_KEY",
        tableName: "YOUR_TABLE_NAME",
      );
      if(!await air.connect())return;
      setState(() {
        airTableData = air.result;
      });
      Map<String, dynamic> _res2 = await air.addData(offset: air.result['offset'].toString());
      if(_res2.isEmpty) return;
      setState(() {
        airTableData['records'].add(_res2['records']);
      });
      Map<String, dynamic> _res3 = await air.addData(offset: _res2['offset'].toString());
      if(_res3.isEmpty) return;
      setState(() {
        airTableData['records'].add(_res3['records']);
      });
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            title: const Text('JamesDev : AirTable Connect'),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: this.netCheck == false
                ? Text("Network ERR!")
                : Text(this.airTableData?.toString() ?? "loading ..."),
            ),
          ),
        ),
      ),
    );
  }
}
