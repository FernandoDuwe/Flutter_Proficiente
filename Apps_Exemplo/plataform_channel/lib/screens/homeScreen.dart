import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  String _getPlataformName() {
    if (kIsWeb)
      return "Web";

    if (Platform.isAndroid)
      return "Android";

    if (Platform.isFuchsia)
      return "Fuchsia";

    if (Platform.isIOS)
      return "iOS";

    if (Platform.isLinux)
      return "Linux";

    if (Platform.isMacOS)
      return "MacOS";

    if (Platform.isWindows)
      return "Windows";

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial - ${this._getPlataformName()}"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("MethodChannel"),
            onTap: () => Navigator.of(context).pushNamed("/method"),
          ),
          ListTile(
            title: Text("EventChannel"),
            onTap: () => Navigator.of(context).pushNamed("/event"),
          ),
          ListTile(
            title: Text("Javascript"),
            onTap: () => Navigator.of(context).pushNamed("/js"),
          ),
        ],
      ),
    );
  }
}
