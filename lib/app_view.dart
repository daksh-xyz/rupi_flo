// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RupiFlo",
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
        background:  Color.fromARGB(255, 245, 245, 245),
        onBackground: Colors.black,
        primary: Color(0xFF00B2E7),
        secondary: Color(0xFFE064F7),
        tertiary: Color(0xFFFF8D6C),
        outline: Color.fromARGB(255, 189,189,189)
      ),
      ),
      home: const HomeScreen(),
    );
  }
}
