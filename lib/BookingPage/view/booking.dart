import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream/BookingPage/controller/booking_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    BookingController bookingController = Get.put(BookingController());
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            bookingController.isLoading.value = true;
            log('start');
          },
          onPageFinished: (String url) {
            if (bookingController.isFirst.value) {
              bookingController.isFirst.value = false;
            } else {
              bookingController.isLoading.value = false;
              bookingController.isFirst.value = true;
              log('finish');
            }
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
      ..loadRequest(Uri.parse("https://streamstek.com/booking-page-for-app"));
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            WebViewWidget(controller: controller),
            bookingController.isLoading.value
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const Stack()
          ],
        ),
      ),
    );
  }
}
