import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/old_main/main.dart';

class Example4HomePage extends ConsumerStatefulWidget {
  const Example4HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Example4HomePageState();
}

class _Example4HomePageState extends ConsumerState<Example4HomePage> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(countProvider);

    // tp listen to changes
    ref.listen(countProvider, ((previous, next) {
      if ((next % 5) == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The value changes to $next"),
          ),
        );
      }
    }));

    return Scaffold(
      appBar: AppBar(
        title: const Text("State Provider Example"),
        actions: [
          IconButton(
            onPressed: () {
              // ref.invalidate(countProvider);
              final newValue = ref.refresh(countProvider);

              log(newValue);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Count value is $count",
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(countProvider.notifier).state++;
          ref.read(countProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
