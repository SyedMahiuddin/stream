import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stream/bottom_nav/view/bottom_nav.dart';


class SplashScreen extends StatefulWidget {
  static  const String routeName="/";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) => Navigator.pushReplacementNamed(context, BottomNavScreen.routeName));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xfff31a54),
                  Colors.white.withOpacity(0.5),
                ],
              ),
            ),
          ),
          // Centered image
          Center(
            child: Container(
              width: 200.w, // Adjust the width as needed
              height: 200.h, // Adjust the height as needed
              decoration: BoxDecoration(
                // color: Color(0xfff31a54),
                borderRadius: BorderRadius.circular(100), // Makes it a circle
              ),
              child: Center(
                child: Image.asset(
                  'images/img.png', // Replace with your image path
                  width: 150, // Adjust the image size as needed
                  height: 150, // Adjust the image size as needed
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
              height: 200.0,
              width: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}
