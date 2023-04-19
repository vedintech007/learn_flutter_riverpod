import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/rivan/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(),
);

final userChangeNotifierProvider = ChangeNotifierProvider(
  (ref) => UserNotifierChange(),
);

class Learn1 extends ConsumerStatefulWidget {
  const Learn1({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Learn1State();
}

class _Learn1State extends ConsumerState<Learn1> {
  void onSubmit(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context) {
    // final name = ref.watch(nameProvider) ?? '';
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey)),
              ),
              onChanged: (value) => onSubmit(ref, value),
              onSubmitted: (value) => onSubmit(ref, value),
            ),
          ),
          Center(
            child: Text("Name entered: ${user.name}"),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey)),
              ),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
              keyboardType: TextInputType.number,
              onChanged: (value) => onSubmitAge(ref, value),
              onSubmitted: (value) => onSubmitAge(ref, value),
            ),
          ),
          Center(
            child: Text("Age entered: ${user.age}"),
          ),
        ],
      ),
    );
  }
}
