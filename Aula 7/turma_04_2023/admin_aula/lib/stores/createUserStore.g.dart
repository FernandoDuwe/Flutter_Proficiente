// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createUserStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateUserStore on _CreateUserStore, Store {
  Computed<bool>? _$podeSalvarComputed;

  @override
  bool get podeSalvar =>
      (_$podeSalvarComputed ??= Computed<bool>(() => super.podeSalvar,
              name: '_CreateUserStore.podeSalvar'))
          .value;
  Computed<bool>? _$existeErroComputed;

  @override
  bool get existeErro =>
      (_$existeErroComputed ??= Computed<bool>(() => super.existeErro,
              name: '_CreateUserStore.existeErro'))
          .value;

  late final _$emailAtom =
      Atom(name: '_CreateUserStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: '_CreateUserStore.senha', context: context);

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

  late final _$confirmarSenhaAtom =
      Atom(name: '_CreateUserStore.confirmarSenha', context: context);

  @override
  String get confirmarSenha {
    _$confirmarSenhaAtom.reportRead();
    return super.confirmarSenha;
  }

  @override
  set confirmarSenha(String value) {
    _$confirmarSenhaAtom.reportWrite(value, super.confirmarSenha, () {
      super.confirmarSenha = value;
    });
  }

  late final _$visualizarSenhaAtom =
      Atom(name: '_CreateUserStore.visualizarSenha', context: context);

  @override
  bool get visualizarSenha {
    _$visualizarSenhaAtom.reportRead();
    return super.visualizarSenha;
  }

  @override
  set visualizarSenha(bool value) {
    _$visualizarSenhaAtom.reportWrite(value, super.visualizarSenha, () {
      super.visualizarSenha = value;
    });
  }

  late final _$mensagemErroAtom =
      Atom(name: '_CreateUserStore.mensagemErro', context: context);

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

  late final _$salvarAsyncAction =
      AsyncAction('_CreateUserStore.salvar', context: context);

  @override
  Future<void> salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  late final _$_CreateUserStoreActionController =
      ActionController(name: '_CreateUserStore', context: context);

  @override
  void setEmail(String newEmail) {
    final _$actionInfo = _$_CreateUserStoreActionController.startAction(
        name: '_CreateUserStore.setEmail');
    try {
      return super.setEmail(newEmail);
    } finally {
      _$_CreateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String newSenha) {
    final _$actionInfo = _$_CreateUserStoreActionController.startAction(
        name: '_CreateUserStore.setSenha');
    try {
      return super.setSenha(newSenha);
    } finally {
      _$_CreateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmarSenha(String newConfirmarSenha) {
    final _$actionInfo = _$_CreateUserStoreActionController.startAction(
        name: '_CreateUserStore.setConfirmarSenha');
    try {
      return super.setConfirmarSenha(newConfirmarSenha);
    } finally {
      _$_CreateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisualizarSenha(bool newVisualizarSenha) {
    final _$actionInfo = _$_CreateUserStoreActionController.startAction(
        name: '_CreateUserStore.setVisualizarSenha');
    try {
      return super.setVisualizarSenha(newVisualizarSenha);
    } finally {
      _$_CreateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
confirmarSenha: ${confirmarSenha},
visualizarSenha: ${visualizarSenha},
mensagemErro: ${mensagemErro},
podeSalvar: ${podeSalvar},
existeErro: ${existeErro}
    ''';
  }
}
