import 'package:list_view_performance/models/recordMockModel.dart';
import 'package:mobx/mobx.dart';

part 'listStore.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  ObservableList<RecordMockModel> registros = ObservableList<RecordMockModel>();

  _ListStore() {
    this._novaPagina();
  }

  @observable
  int pagina = 1;

  @computed
  bool get ehUltimaPagina => this.pagina == 5;

  @action
  Future<void> irProximaPagina() async {
    this.pagina++;

    await Future.delayed(Duration(seconds: 1));

    this._novaPagina();
  }

  void _novaPagina() {
    for (int i = 0; i < 10; i++)
      this.registros.add(RecordMockModel("Nome ${this.registros.length + 1}",
          "Valor ${this.registros.length + 1}"));
  }
}
