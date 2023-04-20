import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorials/home_page/home.dart';
import 'package:riverpod_tutorials/rivan/logger_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        LoggerRiverpod(),
      ],
      child: const RivanHome(),
    ),
  );
}
