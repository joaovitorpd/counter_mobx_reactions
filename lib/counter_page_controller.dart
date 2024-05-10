// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'counter_page_controller.g.dart';

class CounterPageController = _CounterPageControllerBase
    with _$CounterPageController;

abstract class _CounterPageControllerBase with Store {
  @observable
  int counter = 0;

  @computed
  bool get isEven {
    return counter % 2 == 0;
  }

  @action
  void increment() => counter++;
}
