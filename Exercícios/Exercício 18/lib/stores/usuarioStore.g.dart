// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuarioStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsuarioStore on _UsuarioStore, Store {
  Computed<bool>? _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??=
          Computed<bool>(() => super.canSave, name: '_UsuarioStore.canSave'))
      .value;

  late final _$usuarioAtom =
      Atom(name: '_UsuarioStore.usuario', context: context);

  @override
  String get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(String value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$senhaAtom = Atom(name: '_UsuarioStore.senha', context: context);

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('_UsuarioStore.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_UsuarioStoreActionController =
      ActionController(name: '_UsuarioStore', context: context);

  @override
  void setUsuario(String user) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
        name: '_UsuarioStore.setUsuario');
    try {
      return super.setUsuario(user);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String password) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
        name: '_UsuarioStore.setSenha');
    try {
      return super.setSenha(password);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
senha: ${senha},
canSave: ${canSave}
    ''';
  }
}
