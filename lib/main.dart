import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/home_page/ripples_home.dart';

final nameProvider = Provider((ref) => "Hello VED");

final countProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(const ProviderScope(
    child: RipplesHome(),
  ));
}
