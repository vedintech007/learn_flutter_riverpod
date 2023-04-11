import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/main.dart';

class Example5HomePage extends ConsumerStatefulWidget {
  const Example5HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Example5HomePageState();
}

class _Example5HomePageState extends ConsumerState<Example5HomePage> {
  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterDemoProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
        "$counter",
        style: const TextStyle(
          fontSize: 30,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterDemoProvider.notifier).increment();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
