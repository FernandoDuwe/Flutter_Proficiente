import 'package:mobx/mobx.dart';
part 'listTestStore.g.dart';

class ListTestStore = _ListTestStore with _$ListTestStore;

abstract class _ListTestStore with Store {
  @observable
  int page = 1;

  ObservableList<String> list = new ObservableList<String>();

  _ListTestStore() {
    for (int i = 1; i <= 30; i++) list.add("Item $i");
  }

  @action
  Future<void> goToNextPage() async {
    this.page++;

    await Future.delayed(Duration(seconds: 1));

    for (int i = 1; i <= 10; i++) list.add("Item ${list.length}");
  }
}
