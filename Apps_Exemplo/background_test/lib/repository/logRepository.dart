import 'dart:convert';
import 'dart:io';

import 'package:background_test/models/logModel.dart';

class LogRepository {
  List<LogModel> list = [];

  Future<List<LogModel>> getLogs() async {
    List<LogModel> vrResult = [];

    String vrReturn = await this._readData();

    List<dynamic> vrJSON = json.decode(vrReturn);

    vrJSON.forEach((element) {
      vrResult.add(LogModel.fromJSON(element));
    });

    return vrResult;
  }

  Future<File> _getFile() async {
    print(
        "File: /data/user/0/com.example.background_test/app_flutter/logData.jon");

    return File(
        "/data/user/0/com.example.background_test/app_flutter/logData.jon");
  }

  Future<void> _saveData() async {
    List<Map<String, dynamic>> vrJSON = [];

    this.list.forEach((element) {
      vrJSON.add(element.toJSON());
    });

    String vrData = json.encode(vrJSON);

    final File vrFile = await this._getFile();

    vrFile.writeAsString(vrData);
  }

  Future<String> _readData() async {
    try {
      final File vrFile = await this._getFile();

      return vrFile.readAsString();
    } catch (e) {
      return "[]";
    }
  }

  Future<void> addLogAsAppOpened() async {
    this.list = await this.getLogs();

    this.list.add(LogModel.fromOpenedApp());

    this._saveData();
  }

  Future<void> addLogAsBackgroundTask() async {
    this.list = await this.getLogs();

    this.list.add(LogModel.fromBackgroundProcess());

    this._saveData();
  }

  void limpar() {
    this.list = [];

    this._saveData();
  }
}
