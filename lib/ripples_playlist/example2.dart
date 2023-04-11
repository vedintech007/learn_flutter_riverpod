import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/main.dart';

class Example2HomePage extends StatelessWidget {
  const Example2HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final name = ref.watch(nameProvider);

          return Text("Provider 2 content is $name");
        }),
      ),
    );
  }
}
