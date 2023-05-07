import 'package:mobx/mobx.dart';
import '../models/produtoModel.dart';
import '../repositories/produtoRepository.dart';
part 'produtoStore.g.dart';

class ProdutoStore = _ProdutoStore with _$ProdutoStore;

abstract class _ProdutoStore with Store {
  @observable
  String documentId = "";

  @observable
  String nome = "";

  @observable
  double preco = 0.0;

  @observable
  String errorMessage = "";

  @observable
  bool processing = false;

  @computed
  bool get canSave => ((this.nome.isNotEmpty) && (this.preco != 0.0));

  @computed
  bool get hasError => this.errorMessage.isNotEmpty;

  @action
  Future<void> setDocumentId(String documentId) async {
    this.processing = true;

    try {
      ProdutoModel produtoModel =
          await ProdutoRepository.getProduto(documentId);

      this.documentId = produtoModel.documentId;
      this.nome = produtoModel.nome;
      this.preco = produtoModel.preco;
    } finally {
      this.processing = false;
    }
  }

  @action
  void setNome(String nome) {
    this.nome = nome;
  }

  @action
  void setPreco(String preco) {
    this.preco = (double.tryParse(preco) ?? 0.0);
  }

  @action
  Future<void> save() async {
    this.processing = true;

    ProdutoModel produtoModel =
        ProdutoModel(nome: this.nome, preco: this.preco);

    produtoModel.documentId = this.documentId;

    try {
      await ProdutoRepository.save(produtoModel);
    } finally {
      this.processing = false;
    }
  }
}
