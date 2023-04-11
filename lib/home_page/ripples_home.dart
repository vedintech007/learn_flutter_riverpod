import 'package:flutter/material.dart';
import 'package:riverpod_tutorials/ripples_playlist/example3.dart';

class RipplesHome extends StatelessWidget {
  const RipplesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const Example3HomePage(),
    );
  }
}