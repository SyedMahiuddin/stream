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
  final controller = WebViewController();
  BookingController bookingController = Get.put(BookingController());
  @override
  void initState() {
        log('call init state');
   controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            bookingController.isLoading.value = true;
            log('call start : $url');
          },
          onPageFinished: (String url) {
            // if (bookingController.isFirst.value) {
            //   bookingController.isFirst.value = false;
            // } else {
              bookingController.isLoading.value = false;
              // bookingController.isFirst.value = true;
              log('call  finish : $url');
            // }
          },
          onUrlChange: (change) {
            log('call  onUrlChange : $change');
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
      ..loadRequest(Uri.parse("https://streamstek.com/booking-page-for-app/"));
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

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
