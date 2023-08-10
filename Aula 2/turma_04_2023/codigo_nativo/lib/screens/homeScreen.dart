import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const plataform = MethodChannel("codigo_nativo");

  Future<String> _getMessage() async {
    String vrMessage = await plataform.invokeMethod("retornarMensagem");

    return vrMessage;
  }

  Future<double> _getBatteryLevel() async {
    return await plataform.invokeMethod("nivelBateria");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
      ),
      body: FutureBuilder(
        future: this._getMessage(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.red),
              ),
            );

          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Center(
            child: Column(
              children: [
                Text(
                  snapshot.data!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                FutureBuilder(
                    future: this._getBatteryLevel(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return Text(snapshot.error.toString());

                      if (!snapshot.hasData)
                        return CircularProgressIndicator();

                      return Text("Bateria: ${snapshot.data!}%");
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
