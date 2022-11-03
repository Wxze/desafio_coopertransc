import 'package:desafio_coopertransc/view/user_view.dart';
import 'package:flutter/material.dart';
import 'view/login_view.dart';
import 'view/home_view.dart';

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
        '/login': (context) => const LoginView(),
        '/turn': (context) => const HomeView(),
        '/user': (context) => const UserView()
      },
    ),
  );
}
