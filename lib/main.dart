// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'view/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coopertransc',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFE8EEEE),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF316762),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
      },
    ),
  );
}
