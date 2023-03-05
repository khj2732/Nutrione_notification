import 'package:flutter/material.dart';
import 'package:nuserver/constants/sizes.dart';
import 'package:nuserver/features/noti_screen.dart';
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
        //버튼 클릭시 번쩍이는 이벤트 없음
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
      //최초 진입 페이지
      initialRoute: MainNavigationScreen.routeName,
      routes: {
        //각각의 페이지 alias
        MainNavigationScreen.routeName: (context) =>
            const MainNavigationScreen(),
        NotiScreen.routeName: (context) => const NotiScreen(),
      },
    );
  }
}
