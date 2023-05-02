import 'package:flutter/services.dart';

class MethodChannelTest {
  final String _uniqueID = "aulaMethodChannel";
  MethodChannel? _channel;

  MethodChannelTest() {
    this._channel = MethodChannel(this._uniqueID);
  }

  Future<String> helloWorld() async {
    return await this._channel!.invokeMethod("helloWorld");
  }

  Future<String> sayHello(String prUser) async {
    return await this._channel!.invokeMethod("sayHello", {
      "userName": prUser
    });
  }
}