import 'package:background_fetch/background_fetch.dart';
import 'package:background_test/models/logModel.dart';
import 'package:flutter/material.dart';

import '../repository/logRepository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _enabled = true;
  int _status = 0;

  // Evento chamado enquanto a aplicação está aberta
  Future<void> Internal_OnFetch(String prTaskID) async {
    print("[BackgroundFetch][${prTaskID}]: Event received");

    LogRepository vrRepository = new LogRepository();

    vrRepository.addLogAsAppOpened();

    setState(() {});

    // Importante: Você deve sinalizar que a tarefa foi completada, para o SO
    // não puna sua aplicação por estar demorando demais
    BackgroundFetch.finish(prTaskID);
  }

  // Evento chamado quando ocorrer um timeout. Devemos parar imediatamente o que estamos fazendo e finalizar.
  Future<void> Internal_OnTimeOut(String prTaskID) async {
    print("[BackgroundFetch][${prTaskID}]: Task timeout");

    BackgroundFetch.finish(prTaskID);
  }

  // Mensagens da plataforma são assíncronas
  Future<void> initPlatformState() async {
    // Configurando o BackgroundFetch
    int vrStatus = await BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 15,
            // Deve ser maior ou igual a 15 minutos
            stopOnTerminate: false,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.NONE),
        this.Internal_OnFetch,
        this.Internal_OnTimeOut);

    print('[BackgroundFetch] configure success: $vrStatus');

    setState(() {
      _status = vrStatus;
    });

    // Se o widget foi removido da árvore enquanto a mensagem para a plataforma estava
    // sendo enviada, nós deveremos descartar o retorno, para não chamar setState em
    // um widget não existente
    if (!mounted) return;
  }

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  void _onClickEnable(enabled) {
    setState(() {
      _enabled = enabled;
    });

    if (enabled) {
      BackgroundFetch.start().then((int status) {
        print('[BackgroundFetch] start success: $status');
      }).catchError((e) {
        print('[BackgroundFetch] start FAILURE: $e');
      });
    } else {
      BackgroundFetch.stop().then((int status) {
        print('[BackgroundFetch] stop success: $status');
      });
    }
  }

  void _onClickStatus() async {
    int status = await BackgroundFetch.status;

    print('[BackgroundFetch] status: $status');

    setState(() {
      _status = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    LogRepository vrRepository = new LogRepository();

    return Scaffold(
      appBar: AppBar(title: Text('BackgroundFetch Example'), actions: <Widget>[
        Switch(value: _enabled, onChanged: _onClickEnable),
      ]),
      body: Container(
          child: FutureBuilder(
        future: vrRepository.getLogs(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.red),
              ),
            );

          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          if ((snapshot.hasData) && (snapshot.data!.length == 0))
            return Center(
              child: Text("Nenhum registro encontrado"),
            );

          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                LogModel vrModel = snapshot.data![index];

                return ListTile(
                  title: Text(vrModel.dateTime.toString()),
                  subtitle: Text(vrModel.typeStr),
                );
              });
        },
      )),
      bottomNavigationBar: BottomAppBar(
          child: Row(children: <Widget>[
        TextButton(
            onPressed: () {
              LogRepository vrRepository = new LogRepository();

              vrRepository.addLogAsAppOpened();

              setState(() {});
            },
            child: Text("Adicionar")),
        TextButton(
            onPressed: () {
              LogRepository vrRepository = new LogRepository();

              vrRepository.limpar();

              setState(() {});
            },
            child: Text("Limpar")),
        TextButton(
            onPressed: () {
              setState(() {});
            },
            child: Text('Atualizar')),
        TextButton(onPressed: _onClickStatus, child: Text('Status')),
        Container(child: Text("$_status"), margin: EdgeInsets.only(left: 20.0))
      ])),
    );
  }
}
