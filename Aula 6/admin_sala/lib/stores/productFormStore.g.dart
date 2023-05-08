// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productFormStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductFormStore on _ProductFormStore, Store {
  Computed<bool>? _$podeSalvarComputed;

  @override
  bool get podeSalvar =>
      (_$podeSalvarComputed ??= Computed<bool>(() => super.podeSalvar,
              name: '_ProductFormStore.podeSalvar'))
          .value;
  Computed<bool>? _$temErroComputed;

  @override
  bool get temErro => (_$temErroComputed ??= Computed<bool>(() => super.temErro,
          name: '_ProductFormStore.temErro'))
      .value;
  Computed<bool>? _$inserindoComputed;

  @override
  bool get inserindo =>
      (_$inserindoComputed ??= Computed<bool>(() => super.inserindo,
              name: '_ProductFormStore.inserindo'))
          .value;

  late final _$documentIdAtom =
      Atom(name: '_ProductFormStore.documentId', context: context);

  @override
  String get documentId {
    _$documentIdAtom.reportRead();
    return super.documentId;
  }

  @override
  set documentId(String value) {
    _$documentIdAtom.reportWrite(value, super.documentId, () {
      super.documentId = value;
    });
  }

  late final _$nomeAtom =
      Atom(name: '_ProductFormStore.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$precoAtom =
      Atom(name: '_ProductFormStore.preco', context: context);

  @override
  double get preco {
    _$precoAtom.reportRead();
    return super.preco;
  }

  @override
  set preco(double value) {
    _$precoAtom.reportWrite(value, super.preco, () {
      super.preco = value;
    });
  }

  late final _$mensagemErroAtom =
      Atom(name: '_ProductFormStore.mensagemErro', context: context);

  @override
  String get mensagemErro {
    _$mensagemErroAtom.reportRead();
    return super.mensagemErro;
  }

  @override
  set mensagemErro(String value) {
    _$mensagemErroAtom.reportWrite(value, super.mensagemErro, () {
      super.mensagemErro = value;
    });
  }

  late final _$processandoAtom =
      Atom(name: '_ProductFormStore.processando', context: context);

  @override
  bool get processando {
    _$processandoAtom.reportRead();
    return super.processando;
  }

  @override
  set processando(bool value) {
    _$processandoAtom.reportWrite(value, super.processando, () {
      super.processando = value;
    });
  }

  late final _$fromDocumentIdAsyncAction =
      AsyncAction('_ProductFormStore.fromDocumentId', context: context);

  @override
  Future<void> fromDocumentId(String documentId) {
    return _$fromDocumentIdAsyncAction
        .run(() => super.fromDocumentId(documentId));
  }

  late final _$salvarAsyncAction =
      AsyncAction('_ProductFormStore.salvar', context: context);

  @override
  Future<void> salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  late final _$_ProductFormStoreActionController =
      ActionController(name: '_ProductFormStore', context: context);

  @override
  void fromObject(ProductModel produto) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
        name: '_ProductFormStore.fromObject');
    try {
      return super.fromObject(produto);
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String novoNome) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
        name: '_ProductFormStore.setNome');
    try {
      return super.setNome(novoNome);
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPreco(double novoPreco) {
    final _$actionInfo = _$_ProductFormStoreActionController.startAction(
        name: '_ProductFormStore.setPreco');
    try {
      return super.setPreco(novoPreco);
    } finally {
      _$_ProductFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
documentId: ${documentId},
nome: ${nome},
preco: ${preco},
mensagemErro: ${mensagemErro},
processando: ${processando},
podeSalvar: ${podeSalvar},
temErro: ${temErro},
inserindo: ${inserindo}
    ''';
  }
}
