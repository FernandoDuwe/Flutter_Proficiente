import "package:exercicio_mobx_calcuc/stores/calcStore.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

class OperationSelectorButton extends StatelessWidget {
  final String text;
  final CalcStoreOperation operation;

  const OperationSelectorButton(
      {required this.text, required this.operation, super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle selectedStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
    TextStyle notSelected = TextStyle(color: Colors.grey);

    return Observer(
      builder: (context) {
        return TextButton(
            onPressed: () {
              Provider.of<CalcStore>(context, listen: false)
                  .setOperation(operation);
            },
            child: Text(
              text,
              style: (this.operation ==
                  Provider.of<CalcStore>(context, listen: false).operation
                  ? selectedStyle
                  : notSelected),
            ));
      }, );
  }
}
