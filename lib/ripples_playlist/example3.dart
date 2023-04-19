import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/old_main/main.dart';

class Example3HomePage extends ConsumerStatefulWidget {
  const Example3HomePage({super.key});

  @override
  ConsumerState<Example3HomePage> createState() => _Example3HomePageState();
}

class _Example3HomePageState extends ConsumerState<Example3HomePage> {
  @override
  void initState() {
    final name = ref.read(nameProvider);

    if (kDebugMode) {
      print(name);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);

    return Scaffold(
      body: Center(child: Text(name)),
    );
  }
}
