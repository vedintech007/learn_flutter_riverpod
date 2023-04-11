import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/main.dart';

class Example1HomePage extends ConsumerWidget {
  const Example1HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Provider content is $name"),
      ),
    );
  }
}
