import 'dart:isolate';

import 'package:flutter/material.dart';

class SpawnWithMessages extends StatefulWidget {
  const SpawnWithMessages({Key? key}) : super(key: key);

  @override
  State<SpawnWithMessages> createState() => _SpawnWithMessagesState();

  Future<void> sumTo(SendPort prSend) async {
    // Porta por onde eu escutarei as respostas de fora da Thread
    ReceivePort vrReceivePort = ReceivePort();

    // Envio de volta a porta pela qual eu escutarei os retornos
    prSend.send(vrReceivePort.sendPort);

    // Fica ouvindo as mensagens enviadas para dentro da thread
    await for (var vrMessage in vrReceivePort) {
      if (vrMessage is List) {
        print("Mensagem recebida");

        final vrInitialValue = vrMessage[0];
        final vrFinalValue = vrMessage[1];

        double vrTotal = 0;

        for(double vrI = vrInitialValue; vrI <= vrFinalValue; vrI++)
          vrTotal += vrI;

        print(vrMessage);

        final SendPort vrPortToSend = vrMessage[2];

        vrPortToSend.send(vrTotal);
      }
    }
  }
}

class _SpawnWithMessagesState extends State<SpawnWithMessages> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compute"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {

              },
              child: Text("Iniciar"))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    createIsolate();
  }

  Future<void> createIsolate() async {
    // Porta por onde eu escutarei os retornos da thread
    ReceivePort vrReceivePort = ReceivePort();

    // Crio o Isolate
    Isolate.spawn<SendPort>(widget.sumTo, vrReceivePort.sendPort);

    // Fico no aguardo, pois o método dentro da thread precisa me devolver uma porta para que eu possa enviar mensagens
    SendPort vrSendPort = await vrReceivePort.first;

    // Crio outra porta para escutar o retorno da mensagem que eu enviar
    ReceivePort vrReceiveResponsePort = ReceivePort();

    // Mando uma mensagem e a porta pela qual a thread deve me responder
    vrSendPort.send([
      1.0,
      10000.0,
      vrReceiveResponsePort.sendPort
    ]);

    // Esperando a resposta chegar
    final vrResposta = await vrReceiveResponsePort.first;

    print(vrResposta);
  }
}

