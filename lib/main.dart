import 'package:flutter/material.dart';

import 'view/login_screen.dart';
import 'view/turn_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coopertransc',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF1F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A5650),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/turn' :(context) => const TurnScreen(),
      },
    ),
  );
}
