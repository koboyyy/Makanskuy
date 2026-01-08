import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const AppMakanskuy());
}

class AppMakanskuy extends StatelessWidget {
  const AppMakanskuy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Makanskuy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196F3),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        fontFamily: 'Inter',
      ),
      home: const SplashScreen(),
    );
  }
}
