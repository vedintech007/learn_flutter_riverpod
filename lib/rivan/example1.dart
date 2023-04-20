import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/rivan/user.dart';

final fetchUserProvider = FutureProvider.family.autoDispose((ref, String input) {
  // ref.keepAlive();
  // ref.onDispose(() {});
  // ref.onCancel(() {});
  // ref.onResume(() {});
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(input);
});

final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

class Learn1 extends ConsumerStatefulWidget {
  const Learn1({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Learn1State();
}

class _Learn1State extends ConsumerState<Learn1> {
  String userNo = "1";

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(fetchUserProvider(userNo));
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onSubmitted: (value) {
              setState(() {
                userNo = value;
              });
            },
          ),
          Text(
            data.email,
            style: const TextStyle(fontSize: 24),
          ),
        ],
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

// class Learn1 extends ConsumerWidget {
//   const Learn1({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final user = ref.watch(fetchUserProvider);

//     // return ref.watch(streamProvider).when(
//     //       data: (data) {
//     //         return Scaffold(
//     //             body: Center(
//     //           child: Text(
//     //             data.toString(),
//     //           ),
//     //         ));
//     //       },
//     //       error: (error, stackTrace) {
//     //         return Center(
//     //           child: errorScreen(error),
//     //         );
//     //       },
//     //       loading: () => const Center(
//     //         child: CircularProgressIndicator(),
//     //       ),
//     //     );

//     return user.when(
//       data: (data) {
//         return _buildDataScreen(data);
//       },
//       error: (error, stacktrace) => Center(
//         child: errorScreen(error),
//       ),
//       loading: () => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }

//   Widget _buildDataScreen(User data) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(data.name),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const TextField(),
//           Text(
//             data.email,
//             style: const TextStyle(fontSize: 24),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget errorScreen(Object error) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             error.toString(),
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 22,
//               color: Colors.red,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
