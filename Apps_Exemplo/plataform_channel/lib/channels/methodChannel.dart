import 'package:flutter/services.dart';

class MethodChanelTest {
  final String _channelID = "proway/methodChannel";
  MethodChannel? _plataform = null;

  MethodChanelTest() {
    this._plataform = MethodChannel(this._channelID);
  }

  Future<String> getMessage() async {
    return await this._plataform!.invokeMethod("getMessage");
  }

  Future<String> getMessageWithParams(String prUserName) async {
    return await this._plataform!.invokeMethod("getMessageWithParams", {
      "name": prUserName
    });
  }
}