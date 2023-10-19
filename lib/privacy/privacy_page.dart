import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stream/privacy/privacy_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../BookingPage/controller/booking_controller.dart';
import '../appbar.dart';
import '../bottom_nav/controller/bottom_nav_controller.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  void _onItemTapped(int index) {
    BottomNavController bottomNavController = Get.find();
    bottomNavController.selectedIndex.value = index;
    Navigator.pop(context);
    // indexsetState(() {
    //   selectedIndex = index;
    // });
  }

  final controller = WebViewController();
  @override
  void initState() {
    PrivacyController privacyController = Get.put((PrivacyController()));
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            privacyController.isLoading.value = true;
            log('call start');
          },
          onPageFinished: (String url) {
            // if (getPricingController.isFirst.value) {
            //   getPricingController.isFirst.value = false;
            // } else {
            privacyController.isLoading.value = false;
            //   getPricingController.isFirst.value = true;
            log('call finish');
            // }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          "https://streamstek.com/privacy-policy-for-app/"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PrivacyController privacyController = Get.put((PrivacyController()));
    return Obx(
          () => SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(),
          body: Stack(
            children: [
              WebViewWidget(controller: controller),
              privacyController.isLoading.value
                  ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CircularProgressIndicator(),
                ),
              )
                  : const Stack()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true, // Show labels for selected items
            showUnselectedLabels: true, //
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            selectedFontSize: 15.sp,
            backgroundColor: Colors.red,
            currentIndex: 0,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.airplane_ticket_outlined,
                  color: Colors.black,
                ),
                label: 'Ticket',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.event,
                  color: Colors.black,
                ),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.reviews_outlined,
                  color: Colors.black,
                ),
                label: 'Review',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                label: 'Contact',
              ),
            ],
            // selectedLabelStyle: TextStyle(color: Color(0xFFF31A54)),
            // unselectedLabelStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
