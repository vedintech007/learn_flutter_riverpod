import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/main.dart';

class Example7HomePage extends ConsumerWidget {
  const Example7HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Provider"),
      ),
      body: streamData.when(
        data: (data) => Center(
          child: Text(
            data.toString(),
            style: const TextStyle(fontSize: 25),
          ),
        ),
        error: ((error, stackTrace) => Text(error.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
