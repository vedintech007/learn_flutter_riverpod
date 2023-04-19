import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/home_page/ripples_home.dart';
import 'package:riverpod_tutorials/ripples_playlist/example6/api_service.dart';
import 'package:riverpod_tutorials/ripples_playlist/example4/example_4_counter.dart';

final nameProvider = Provider((ref) => "Hello VED");

final countProvider = StateProvider<int>((ref) => 0);

final counterDemoProvider = StateNotifierProvider<CounterDemo, int>(
  (ref) => CounterDemo(),
);

final apiProvider = Provider<ApiService>(
  (ref) => ApiService(),
);

final userDataProvider = FutureProvider(
  (ref) => ref.read(apiProvider).getUser(),
);

final streamProvider = StreamProvider<int>(
  (ref) => Stream.periodic(
    const Duration(seconds: 2),
    (((computationCount) => computationCount)),
  ),
);

void main() {
  runApp(const ProviderScope(
    child: RipplesHome(),
  ));
}
