// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListStore on _ListStore, Store {
  Computed<bool>? _$ehUltimaPaginaComputed;

  @override
  bool get ehUltimaPagina =>
      (_$ehUltimaPaginaComputed ??= Computed<bool>(() => super.ehUltimaPagina,
              name: '_ListStore.ehUltimaPagina'))
          .value;

  late final _$paginaAtom = Atom(name: '_ListStore.pagina', context: context);

  @override
  int get pagina {
    _$paginaAtom.reportRead();
    return super.pagina;
  }

  @override
  set pagina(int value) {
    _$paginaAtom.reportWrite(value, super.pagina, () {
      super.pagina = value;
    });
  }

  late final _$irProximaPaginaAsyncAction =
      AsyncAction('_ListStore.irProximaPagina', context: context);

  @override
  Future<void> irProximaPagina() {
    return _$irProximaPaginaAsyncAction.run(() => super.irProximaPagina());
  }

  @override
  String toString() {
    return '''
pagina: ${pagina},
ehUltimaPagina: ${ehUltimaPagina}
    ''';
  }
}
