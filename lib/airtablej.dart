// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Airtablej{

  /// AirTable -> Account -> API Key
  final String key;
  /// AirTable Table Name
  final String tableName;
  /// AirTable  EndPoint : AirTable -> Table -> API Documentation
  final String endPoint;

  /// Response Body
  /// |- Content-Type : JSON
  Map<String, dynamic> _result;
  Map<String, dynamic> get result => this._result;
  set result(Map<String, dynamic> serverData){
    this._result = serverData;
    return;
  }

  Airtablej({
    @required this.key,
    @required this.tableName,
    this.endPoint = "https://api.airtable.com/v0/appwOWIDaRO0TiSDf"
  }):assert(key != null), assert(tableName != null);

  // HTTP Connect & Check
  // OutPut : this.result
  /// ex)
  /// bool check = await AirTablej(...).connect();
  ///
  /// or
  ///
  /// AirTable air = new AirTablej(...)
  /// await air.connect()
  /// Map<String, dyanmic> result = air.result;
  /// if(result == null)
  /// else if(result.isEmpty)
  /// return result
  Future<bool> connect() async => Future.microtask(() async => await _net());

  Future<bool> _net() async{
    final String _url = endPoint + '/' + this.tableName + "?api_key=" + this.key;
    try{
      final http.Response _res = await http.get(_url)
          .timeout(Duration(seconds: 8), onTimeout: () async => new http.Response("[]", 404));
      if(_res.statusCode != 200){
        this.result = {};
        return false;
      }
      final Map<String, dynamic> _resBody = json.decode(_res.body);
      this.result = _resBody;
      return true;
    }
    catch(e){
      this.result = {};
      return false;
    }
  }
}