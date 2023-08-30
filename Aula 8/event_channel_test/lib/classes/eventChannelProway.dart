import 'package:flutter/services.dart';

class EventChannelProway {
  final String _eventChannelId = "proway/testeAula";
  late EventChannel _eventChannel;

  EventChannelProway() {
    _eventChannel = EventChannel(_eventChannelId);
  }

  EventChannel get stream => _eventChannel;
}