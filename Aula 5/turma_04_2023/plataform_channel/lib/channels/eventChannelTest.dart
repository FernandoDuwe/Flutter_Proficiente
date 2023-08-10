import 'package:flutter/services.dart';

class EventChannelTest {
  final String _uniqueID = "aulaEventChannel";
  EventChannel? _channel;

  EventChannelTest() {
    this._channel = EventChannel(this._uniqueID);
  }

  EventChannel get channel => this._channel!;
}