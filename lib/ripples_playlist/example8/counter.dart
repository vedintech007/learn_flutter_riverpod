import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/ripples_playlist/example4/example_4_counter.dart';

final counterProvider = StateNotifierProvider.autoDispose<CounterDemo, int>(
  (ref) {
    // ref.keepAlive();
    final link = ref.keepAlive();
    final timer = Timer(const Duration(seconds: 10), () {
      link.close();
    });

    ref.onDispose(() {
      timer.cancel();
    });
    return CounterDemo();
  },
);

class Counter extends ConsumerWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: Text(
          "Counter is $counter",
          style: const TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
