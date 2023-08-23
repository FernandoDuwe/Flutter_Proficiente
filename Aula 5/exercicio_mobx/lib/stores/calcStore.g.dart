// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calcStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalcStore on _CalcStore, Store {
  Computed<double>? _$resultComputed;

  @override
  double get result => (_$resultComputed ??=
          Computed<double>(() => super.result, name: '_CalcStore.result'))
      .value;

  late final _$valor1Atom = Atom(name: '_CalcStore.valor1', context: context);

  @override
  double get valor1 {
    _$valor1Atom.reportRead();
    return super.valor1;
  }

  @override
  set valor1(double value) {
    _$valor1Atom.reportWrite(value, super.valor1, () {
      super.valor1 = value;
    });
  }

  late final _$valor2Atom = Atom(name: '_CalcStore.valor2', context: context);

  @override
  double get valor2 {
    _$valor2Atom.reportRead();
    return super.valor2;
  }

  @override
  set valor2(double value) {
    _$valor2Atom.reportWrite(value, super.valor2, () {
      super.valor2 = value;
    });
  }

  late final _$operationIndexAtom =
      Atom(name: '_CalcStore.operationIndex', context: context);

  @override
  int get operationIndex {
    _$operationIndexAtom.reportRead();
    return super.operationIndex;
  }

  @override
  set operationIndex(int value) {
    _$operationIndexAtom.reportWrite(value, super.operationIndex, () {
      super.operationIndex = value;
    });
  }

  late final _$operationAtom =
      Atom(name: '_CalcStore.operation', context: context);

  @override
  CalcStoreOperation get operation {
    _$operationAtom.reportRead();
    return super.operation;
  }

  @override
  set operation(CalcStoreOperation value) {
    _$operationAtom.reportWrite(value, super.operation, () {
      super.operation = value;
    });
  }

  late final _$_CalcStoreActionController =
      ActionController(name: '_CalcStore', context: context);

  @override
  void setValor1(String value) {
    final _$actionInfo =
        _$_CalcStoreActionController.startAction(name: '_CalcStore.setValor1');
    try {
      return super.setValor1(value);
    } finally {
      _$_CalcStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValor2(String value) {
    final _$actionInfo =
        _$_CalcStoreActionController.startAction(name: '_CalcStore.setValor2');
    try {
      return super.setValor2(value);
    } finally {
      _$_CalcStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOperation(CalcStoreOperation value) {
    final _$actionInfo = _$_CalcStoreActionController.startAction(
        name: '_CalcStore.setOperation');
    try {
      return super.setOperation(value);
    } finally {
      _$_CalcStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valor1: ${valor1},
valor2: ${valor2},
operationIndex: ${operationIndex},
operation: ${operation},
result: ${result}
    ''';
  }
}
