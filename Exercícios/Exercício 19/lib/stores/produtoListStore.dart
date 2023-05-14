import 'package:admin_page/models/produtoModel.dart';
import 'package:admin_page/repositories/produtoRepository.dart';
import 'package:mobx/mobx.dart';
part 'produtoListStore.g.dart';

class ProdutoListStore = _ProdutoListStore with _$ProdutoListStore;

abstract class _ProdutoListStore with Store {
  ObservableList<ProdutoModel> produtos = ObservableList<ProdutoModel>();

  _ProdutoListStore() {
    this.pesquisar("");
  }

  @observable
  String pesquisa = "";

  @action
  Future<void> pesquisar(String search) async {
    this.pesquisa = search;

    produtos.clear();

    List<ProdutoModel> lista = await ProdutoRepository.getProdutos(search);

    produtos.addAll(lista);
  }
}