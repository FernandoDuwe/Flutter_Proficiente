// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messageStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MessageStore on _MessageStore, Store {
  late final _$originAtom =
      Atom(name: '_MessageStore.origin', context: context);

  @override
  String get origin {
    _$originAtom.reportRead();
    return super.origin;
  }

  @override
  set origin(String value) {
    _$originAtom.reportWrite(value, super.origin, () {
      super.origin = value;
    });
  }

  late final _$destinyAtom =
      Atom(name: '_MessageStore.destiny', context: context);

  @override
  String get destiny {
    _$destinyAtom.reportRead();
    return super.destiny;
  }

  @override
  set destiny(String value) {
    _$destinyAtom.reportWrite(value, super.destiny, () {
      super.destiny = value;
    });
  }

  @override
  String toString() {
    return '''
origin: ${origin},
destiny: ${destiny}
    ''';
  }
}
