import 'package:flutter/material.dart';

import '../channels/eventChannelTest.dart';

class EventChannelScreen extends StatelessWidget {
  EventChannelTest eventChannelTest = EventChannelTest();

  EventChannelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventChannel"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: this.eventChannelTest.channel.receiveBroadcastStream(),
          builder: (context, snapshot) {
            return Text(snapshot.data);
          },
        ),
      ),
    );
  }
}
