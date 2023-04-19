import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/home_page/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: RivanHome(),
    ),
  );
}
