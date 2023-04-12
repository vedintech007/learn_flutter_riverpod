import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentDate = Provider<DateTime>(
  (ref) => DateTime.now(),
);

class Example1HomePage extends ConsumerWidget {
  const Example1HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Example 1"),
      ),
      body: Center(
        child: Text(
          date.toIso8601String(),
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
