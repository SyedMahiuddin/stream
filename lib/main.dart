import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream/bottom_nav.dart';
import 'package:stream/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Streamstek',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute:SplashScreen.routeName,
        routes: {
          BottomNavScreen.routeName:(context) => BottomNavScreen(),
          SplashScreen.routeName:(context) => SplashScreen(),
        },
      ),
    );
  }
}

