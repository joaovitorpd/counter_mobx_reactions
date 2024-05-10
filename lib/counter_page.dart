// ignore_for_file: avoid_print

import 'package:another_flushbar/flushbar.dart';
import 'package:counter_mobx_reactions/counter_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final controller = CounterPageController();

  List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    disposers = [
      //In this example, "0" will be skipped and the first even number to be considered will be "2"
      /* reaction<int>((r) => controller.counter, (counter) {
      if (counter % 2 == 0) {
        Flushbar(
          title: "Opa!",
          message: "É par!",
          duration: const Duration(milliseconds: 800),
        ).show(context);
      }
    }), */
      //
      //Or could be boolean like this:
      reaction<bool>((r) => controller.isEven, (isEven) {
        if (isEven) {
          Flushbar(
            title: "Opa!",
            message: "É par!",
            duration: const Duration(milliseconds: 800),
          ).show(context);
        }
      }),
      //
      //The when() method happens only one time and then is auto-disposed
      when(
          (r) => controller.counter == 10,
          () => Flushbar(
                title: "Opa!",
                message: "É 10!!!",
                duration: const Duration(milliseconds: 800),
              ).show(context)),

      autorun((r) => print("${controller.counter}")),
    ];
    super.initState();
  }

  @override
  void dispose() {
    //disposers.forEach((dispose) => dispose());
    //OR
    for (var dispose in disposers) {
      dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Mobx Reactions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) {
                return Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
