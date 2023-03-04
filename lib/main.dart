import 'package:flutter/material.dart';
import 'package:nuserver/constants/sizes.dart';
import 'package:nuserver/services/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrione Server Notifications',
      theme: ThemeData(
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF45c91a),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size14 + Sizes.size2,
          ),
        ),
      ),
      initialRoute: MainNavigationScreen.routeName,
      routes: {
        MainNavigationScreen.routeName: (context) =>
            const MainNavigationScreen(),
      },
    );
  }
}
