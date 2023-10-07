
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream/ReviewPage/controller/review_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReviewController reviewController = Get.put(ReviewController());
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
         onPageStarted: (String url) {
            reviewController.isLoading.value = true;
            log('call start');
          },
          onPageFinished: (String url) {
         
              reviewController.isLoading.value = false;
         log('call finish');
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
      ..loadRequest(Uri.parse("https://streamstek.com/review-page-for-app/"));
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            WebViewWidget(controller: controller),
            reviewController.isLoading.value
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
