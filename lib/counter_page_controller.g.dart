// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterPageController on _CounterPageControllerBase, Store {
  Computed<bool>? _$isEvenComputed;

  @override
  bool get isEven => (_$isEvenComputed ??= Computed<bool>(() => super.isEven,
          name: '_CounterPageControllerBase.isEven'))
      .value;

  late final _$counterAtom =
      Atom(name: '_CounterPageControllerBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$_CounterPageControllerBaseActionController =
      ActionController(name: '_CounterPageControllerBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_CounterPageControllerBaseActionController
        .startAction(name: '_CounterPageControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter},
isEven: ${isEven}
    ''';
  }
}
