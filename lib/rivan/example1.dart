import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/rivan/user.dart';

final fetchUserProvider = FutureProvider<User>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData();
});

class Learn1 extends ConsumerWidget {
  const Learn1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);

    return user.when(
      data: (data) {
        return _buildDataScreen(data);
      },
      error: (error, stacktrace) => Center(
        child: errorScreen(error),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildDataScreen(User data) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
      body: Center(
        child: Text(
          data.email,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget errorScreen(Object error) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
