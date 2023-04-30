import 'package:flutter/services.dart';

class EventChannelTest {
  final String _channelID = "proway/eventChannel";
  EventChannel? _plataform = null;

  EventChannelTest() {
    this._plataform = EventChannel(this._channelID);
  }

  EventChannel get plataform => this._plataform!;
}