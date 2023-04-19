import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/old_main/main.dart';

class Example6HomePage extends ConsumerWidget {
  const Example6HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Data"),
      ),
      body: userData.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final userData = data[index];
            return ListTile(
              title: Text("${userData.firstname} ${userData.lastname}"),
              subtitle: Text(userData.email),
              leading: CircleAvatar(
                child: Image.network(userData.avatar),
              ),
            );
          },
        ),
        error: ((error, stackTrace) => Text(error.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
