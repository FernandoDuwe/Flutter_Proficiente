import 'package:mobx/mobx.dart';
part 'calcStore.g.dart';

enum CalcStoreOperation { sum, dec, mult, div }

class CalcStore = _CalcStore with _$CalcStore;

abstract class _CalcStore with Store {
    @observable
    double valor1 = 0;

    @observable
    double valor2 = 0;

    @observable
    int operationIndex = 0;

    @observable
    CalcStoreOperation operation = CalcStoreOperation.sum;

    @computed
    double get result {
      if (operation == CalcStoreOperation.sum)
        return valor1 + valor2;

      if (operation == CalcStoreOperation.dec)
        return valor1 - valor2;

      if (operation == CalcStoreOperation.mult)
        return valor1 * valor2;

      if (operation == CalcStoreOperation.div)
        return valor1 / valor2;

      return 0;
    }

    @action
    void setValor1(String value) {
      double? newValue = double.tryParse(value);

      if (newValue != null)
        valor1 = newValue;
    }

    @action
    void setValor2(String value) {
      double? newValue = double.tryParse(value);

      if (newValue != null)
        valor2 = newValue;
    }

    @action
    void setOperation(CalcStoreOperation value) {
      operation = value;

      operationIndex = value.index;
    }
}