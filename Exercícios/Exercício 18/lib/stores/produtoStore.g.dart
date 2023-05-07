// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtoStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutoStore on _ProdutoStore, Store {
  Computed<bool>? _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??=
          Computed<bool>(() => super.canSave, name: '_ProdutoStore.canSave'))
      .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_ProdutoStore.hasError'))
      .value;

  late final _$documentIdAtom =
      Atom(name: '_ProdutoStore.documentId', context: context);

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

  late final _$nomeAtom = Atom(name: '_ProdutoStore.nome', context: context);

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

  late final _$precoAtom = Atom(name: '_ProdutoStore.preco', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_ProdutoStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$processingAtom =
      Atom(name: '_ProdutoStore.processing', context: context);

  @override
  bool get processing {
    _$processingAtom.reportRead();
    return super.processing;
  }

  @override
  set processing(bool value) {
    _$processingAtom.reportWrite(value, super.processing, () {
      super.processing = value;
    });
  }

  late final _$setDocumentIdAsyncAction =
      AsyncAction('_ProdutoStore.setDocumentId', context: context);

  @override
  Future<void> setDocumentId(String documentId) {
    return _$setDocumentIdAsyncAction
        .run(() => super.setDocumentId(documentId));
  }

  late final _$saveAsyncAction =
      AsyncAction('_ProdutoStore.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_ProdutoStoreActionController =
      ActionController(name: '_ProdutoStore', context: context);

  @override
  void setNome(String nome) {
    final _$actionInfo = _$_ProdutoStoreActionController.startAction(
        name: '_ProdutoStore.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$_ProdutoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPreco(String preco) {
    final _$actionInfo = _$_ProdutoStoreActionController.startAction(
        name: '_ProdutoStore.setPreco');
    try {
      return super.setPreco(preco);
    } finally {
      _$_ProdutoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
documentId: ${documentId},
nome: ${nome},
preco: ${preco},
errorMessage: ${errorMessage},
processing: ${processing},
canSave: ${canSave},
hasError: ${hasError}
    ''';
  }
}
