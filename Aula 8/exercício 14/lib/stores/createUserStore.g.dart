// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createUserStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateUserStore on _CreateUserStore, Store {
  Computed<bool>? _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??=
          Computed<bool>(() => super.canSave, name: '_CreateUserStore.canSave'))
      .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_CreateUserStore.hasError'))
          .value;

  late final _$userNameAtom =
      Atom(name: '_CreateUserStore.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$nickNameAtom =
      Atom(name: '_CreateUserStore.nickName', context: context);

  @override
  String get nickName {
    _$nickNameAtom.reportRead();
    return super.nickName;
  }

  @override
  set nickName(String value) {
    _$nickNameAtom.reportWrite(value, super.nickName, () {
      super.nickName = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_CreateUserStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CreateUserStore.errorMessage', context: context);

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

  late final _$saveAsyncAction =
      AsyncAction('_CreateUserStore.save', context: context);

  @override
  Future<bool> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_CreateUserStoreActionController =
      ActionController(name: '_CreateUserStore', context: context);

  @override
  void setUserName(String value) {
    final _$actionInfo = _$_CreateUserStoreActionController.startAction(
        name: '_CreateUserStore.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$_CreateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNickName(String value) {
    final _$actionInfo = _$_CreateUserStoreActionController.startAction(
        name: '_CreateUserStore.setNickName');
    try {
      return super.setNickName(value);
    } finally {
      _$_CreateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
nickName: ${nickName},
loading: ${loading},
errorMessage: ${errorMessage},
canSave: ${canSave},
hasError: ${hasError}
    ''';
  }
}
