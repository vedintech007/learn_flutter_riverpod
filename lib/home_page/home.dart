import 'package:flutter/material.dart';
import 'package:riverpod_tutorials/rivan/example1.dart';

class RivanHome extends StatelessWidget {
  const RivanHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leaning Riverpod',
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
      home: const Learn1(),
    );
  }
}
