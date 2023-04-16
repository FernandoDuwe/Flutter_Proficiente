// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<String>? _$currentUserNameComputed;

  @override
  String get currentUserName => (_$currentUserNameComputed ??= Computed<String>(
          () => super.currentUserName,
          name: '_UserStore.currentUserName'))
      .value;
  Computed<bool>? _$existsUserComputed;

  @override
  bool get existsUser => (_$existsUserComputed ??=
          Computed<bool>(() => super.existsUser, name: '_UserStore.existsUser'))
      .value;

  late final _$currentUserAtom =
      Atom(name: '_UserStore.currentUser', context: context);

  @override
  UserModel? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$setUserAsyncAction =
      AsyncAction('_UserStore.setUser', context: context);

  @override
  Future<void> setUser(UserModel prUser) {
    return _$setUserAsyncAction.run(() => super.setUser(prUser));
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
currentUserName: ${currentUserName},
existsUser: ${existsUser}
    ''';
  }
}
