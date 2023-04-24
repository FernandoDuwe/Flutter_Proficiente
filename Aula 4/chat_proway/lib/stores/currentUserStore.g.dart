// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currentUserStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentUserStore on _CurrentUserStore, Store {
  Computed<String>? _$currentUserNickNameComputed;

  @override
  String get currentUserNickName => (_$currentUserNickNameComputed ??=
          Computed<String>(() => super.currentUserNickName,
              name: '_CurrentUserStore.currentUserNickName'))
      .value;
  Computed<String>? _$currentUserAvatarImageComputed;

  @override
  String get currentUserAvatarImage => (_$currentUserAvatarImageComputed ??=
          Computed<String>(() => super.currentUserAvatarImage,
              name: '_CurrentUserStore.currentUserAvatarImage'))
      .value;
  Computed<bool>? _$currentUserHasDocumentComputed;

  @override
  bool get currentUserHasDocument => (_$currentUserHasDocumentComputed ??=
          Computed<bool>(() => super.currentUserHasDocument,
              name: '_CurrentUserStore.currentUserHasDocument'))
      .value;

  late final _$currentUserAtom =
      Atom(name: '_CurrentUserStore.currentUser', context: context);

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

  late final _$userNameAtom =
      Atom(name: '_CurrentUserStore.userName', context: context);

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

  late final _$setUserNameAsyncAction =
      AsyncAction('_CurrentUserStore.setUserName', context: context);

  @override
  Future<void> setUserName(String prUsername) {
    return _$setUserNameAsyncAction.run(() => super.setUserName(prUsername));
  }

  late final _$updateUserAsyncAction =
      AsyncAction('_CurrentUserStore.updateUser', context: context);

  @override
  Future<void> updateUser(UserModel prUser) {
    return _$updateUserAsyncAction.run(() => super.updateUser(prUser));
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
userName: ${userName},
currentUserNickName: ${currentUserNickName},
currentUserAvatarImage: ${currentUserAvatarImage},
currentUserHasDocument: ${currentUserHasDocument}
    ''';
  }
}
