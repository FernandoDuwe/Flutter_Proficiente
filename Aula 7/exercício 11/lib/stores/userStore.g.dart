// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<String>? _$userNameComputed;

  @override
  String get userName => (_$userNameComputed ??=
          Computed<String>(() => super.userName, name: '_UserStore.userName'))
      .value;
  Computed<String>? _$nickNameComputed;

  @override
  String get nickName => (_$nickNameComputed ??=
          Computed<String>(() => super.nickName, name: '_UserStore.nickName'))
      .value;
  Computed<String>? _$avatarImageComputed;

  @override
  String get avatarImage =>
      (_$avatarImageComputed ??= Computed<String>(() => super.avatarImage,
              name: '_UserStore.avatarImage'))
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

  late final _$docIdAtom = Atom(name: '_UserStore.docId', context: context);

  @override
  String get docId {
    _$docIdAtom.reportRead();
    return super.docId;
  }

  @override
  set docId(String value) {
    _$docIdAtom.reportWrite(value, super.docId, () {
      super.docId = value;
    });
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void setUserName(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNickName(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setNickName');
    try {
      return super.setNickName(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAvatarImage(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setAvatarImage');
    try {
      return super.setAvatarImage(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getUserByUserName(String userName) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.getUserByUserName');
    try {
      return super.getUserByUserName(userName);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
docId: ${docId},
userName: ${userName},
nickName: ${nickName},
avatarImage: ${avatarImage}
    ''';
  }
}
