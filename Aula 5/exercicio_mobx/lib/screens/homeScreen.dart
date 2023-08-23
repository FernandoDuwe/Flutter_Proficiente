import "package:exercicio_mobx_calcuc/stores/calcStore.dart";
import "package:exercicio_mobx_calcuc/widgets/operationSelector.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Card(
          elevation: 30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OperationSelector(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Valor 1"
                  ),
                  onChanged: (value) {
                    Provider.of<CalcStore>(context, listen: false).setValor1(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Valor 2"
                  ),
                  onChanged: (value) {
                    Provider.of<CalcStore>(context, listen: false).setValor2(value);
                  },
                ),
              ),
              Observer(
                builder: (context) {
                  double result = Provider.of<CalcStore>(context).result;

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "= ${result.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.purple,
          Colors.purpleAccent,
        ])),
      ),
    );
  }
}
