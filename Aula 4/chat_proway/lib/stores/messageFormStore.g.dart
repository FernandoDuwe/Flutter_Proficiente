// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messageFormStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MessageFormStore on _MessageFormStore, Store {
  Computed<bool>? _$canSendComputed;

  @override
  bool get canSend => (_$canSendComputed ??= Computed<bool>(() => super.canSend,
          name: '_MessageFormStore.canSend'))
      .value;

  late final _$messageAtom =
      Atom(name: '_MessageFormStore.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$processingAtom =
      Atom(name: '_MessageFormStore.processing', context: context);

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

  late final _$sendMessageAsyncAction =
      AsyncAction('_MessageFormStore.sendMessage', context: context);

  @override
  Future<void> sendMessage(MessageModel prMessage) {
    return _$sendMessageAsyncAction.run(() => super.sendMessage(prMessage));
  }

  late final _$_MessageFormStoreActionController =
      ActionController(name: '_MessageFormStore', context: context);

  @override
  void setMessage(String prNewMessage) {
    final _$actionInfo = _$_MessageFormStoreActionController.startAction(
        name: '_MessageFormStore.setMessage');
    try {
      return super.setMessage(prNewMessage);
    } finally {
      _$_MessageFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message},
processing: ${processing},
canSend: ${canSend}
    ''';
  }
}
