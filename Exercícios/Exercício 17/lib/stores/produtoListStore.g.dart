// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtoListStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutoListStore on _ProdutoListStore, Store {
  late final _$pesquisaAtom =
      Atom(name: '_ProdutoListStore.pesquisa', context: context);

  @override
  String get pesquisa {
    _$pesquisaAtom.reportRead();
    return super.pesquisa;
  }

  @override
  set pesquisa(String value) {
    _$pesquisaAtom.reportWrite(value, super.pesquisa, () {
      super.pesquisa = value;
    });
  }

  late final _$pesquisarAsyncAction =
      AsyncAction('_ProdutoListStore.pesquisar', context: context);

  @override
  Future<void> pesquisar(String search) {
    return _$pesquisarAsyncAction.run(() => super.pesquisar(search));
  }

  @override
  String toString() {
    return '''
pesquisa: ${pesquisa}
    ''';
  }
}
