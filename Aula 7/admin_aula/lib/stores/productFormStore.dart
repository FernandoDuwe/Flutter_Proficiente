import 'package:admin_sala/models/productModel.dart';
import 'package:mobx/mobx.dart';

import '../repositories/productRepository.dart';

part 'productFormStore.g.dart';

class ProductFormStore = _ProductFormStore with _$ProductFormStore;

abstract class _ProductFormStore with Store {
  _ProductFormStore() {
    setPreco(0);
  }
  
  @observable
  String documentId = "";

  @observable
  String nome = "";

  @observable
  double preco = 0.0;

  @observable
  String mensagemErro = "";

  @observable
  bool processando = false;

  @computed
  bool get podeSalvar => ((this.nome.isNotEmpty) && (this.mensagemErro.isEmpty));

  @computed
  bool get temErro => this.mensagemErro.isNotEmpty;

  @computed
  bool get inserindo => this.documentId.isEmpty;

  @action
  Future<void> fromDocumentId(String documentId) async {
    this.fromObject(
      await ProductRepository.getProduct(documentId)
    );
  }

  @action
  void fromObject(ProductModel produto) {
    this.documentId = produto.documentId;
    this.nome = produto.nome;
    this.preco = produto.preco;
  }

  @action
  void setNome(String novoNome) {
    this.nome = novoNome;
  }

  @action
  void setPreco(double novoPreco) {
    this.preco = novoPreco;

    this.mensagemErro = "";

    if (this.preco == 0)
      this.mensagemErro = "O valor do produto não pode ser zerado";

    if (this.preco < 0)
      this.mensagemErro = "O valor do produto não pode ser menor que zero";
  }

  @action
  Future<void> salvar() async {
    await ProductRepository.saveProduct(ProductModel(
      nome: this.nome,
      preco: this.preco,
      documentId: this.documentId
    ));
  }
}