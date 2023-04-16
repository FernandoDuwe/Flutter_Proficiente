import 'package:background_test/repository/logRepository.dart';
import 'package:flutter/material.dart';
import 'package:background_fetch/background_fetch.dart';

import 'models/logModel.dart';

// Somente para Android: A Headless Task é executada quando o app é terminado, quando o enableHeadless = True
// É necessário adicionar a anotação no método para evitar problemas em release, em versões Flutter >= 3.3.0
@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String vrTaskID = task.taskId;
  bool vrIsTimeOut = task.timeout;

  if (vrIsTimeOut) {
    // O timeout passou, devemos parar o processamento e encerrar a tarefa.
    print("[background_fetch][${vrTaskID}]: Timeout");
    BackgroundFetch.finish(vrTaskID);
    return;
  }

  print("[background_fetch][${vrTaskID}]: Executando");

  // Aqui nós executamos a nossa regra
  LogRepository vrRepository = new LogRepository();

  vrRepository.addLogAsBackgroundTask();

  BackgroundFetch.finish(vrTaskID);
}

void main() {
  runApp(const MyApp());

  // Quando a aplicação for finalizada, registramos a tarefa de background
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
