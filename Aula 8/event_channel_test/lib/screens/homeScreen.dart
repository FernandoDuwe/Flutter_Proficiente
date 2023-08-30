import "package:flutter/material.dart";
import "package:event_channel_test/classes/eventChannelProway.dart";

class HomeScreen extends StatelessWidget {
  EventChannelProway eventChannelProway = new EventChannelProway();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventChannel"),
      ),
      body: StreamBuilder(
        stream: eventChannelProway.stream.receiveBroadcastStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(snapshot.error.toString()),
            );

          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Icon(
                    Icons.timer_outlined,
                    size: 128,
                  ),
                ),
                Text(
                  snapshot.data,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
