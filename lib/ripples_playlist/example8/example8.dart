import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Example8Homepage extends StatelessWidget {
  const Example8Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push("/counter");
          },
          child: const Text("Counter"),
        ),
      ),
    );
  }
}
