import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_tutorials/ripples_playlist/example8/counter.dart';
import 'package:riverpod_tutorials/ripples_playlist/example8/example8.dart';

class RipplesHome extends StatelessWidget {
  const RipplesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Riverpod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.cyan,
        ),
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      // home: const Example8Homepage(),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const Example8Homepage(),
    ),
    GoRoute(path: "/counter", builder: (context, state) => const Counter()),
  ],
);
