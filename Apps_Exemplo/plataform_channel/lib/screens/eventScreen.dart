import 'package:flutter/material.dart';
import 'package:plataform_channel/channels/eventChannel.dart';

class EventScreen extends StatelessWidget {
  EventChannelTest _channelTest = EventChannelTest();

  EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventChannel"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: this._channelTest.plataform.receiveBroadcastStream(),
          builder: (context, snapshot) {
            return Text(snapshot.data);
          },
        )
      ),
    );
  }
}
