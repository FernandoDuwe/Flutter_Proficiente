import 'dart:js_util';

import 'package:admin_sala/models/productModel.dart';
import 'package:mobx/mobx.dart';

import '../repositories/productRepository.dart';

part 'productSearchStore.g.dart';

class ProductSearchStore = _ProductSearchStore with _$ProductSearchStore;

abstract class _ProductSearchStore with Store {
  ObservableList<ProductModel> produtos = ObservableList<ProductModel>();

  _ProductSearchStore() {
    ProductRepository.getAll("").then((value) => produtos.addAll(value));
  }

  @observable
  String pesquisa = "";

  @action
  Future<void> setPesquisa(String newPesquisa) async {
    this.pesquisa = newPesquisa;

    await Future.delayed(Duration(seconds: 1));

    if (this.pesquisa != newPesquisa)
      return;

    produtos.clear();

    produtos.addAll( await ProductRepository.getAll(pesquisa) );
  }
}