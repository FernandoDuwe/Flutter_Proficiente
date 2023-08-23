import "package:exercicio_mobx_calcuc/stores/calcStore.dart";
import "package:exercicio_mobx_calcuc/widgets/operationSelectorButton.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";

class OperationSelector extends StatelessWidget {
  const OperationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OperationSelectorButton(
            text: "Soma", operation: CalcStoreOperation.sum),
        OperationSelectorButton(
            text: "Subtração", operation: CalcStoreOperation.dec),
        OperationSelectorButton(
            text: "Multiplicação", operation: CalcStoreOperation.mult),
        OperationSelectorButton(
            text: "Divisão", operation: CalcStoreOperation.div)
      ],
    );
  }
}
