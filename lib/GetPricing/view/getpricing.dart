import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream/GetPricing/Controller/get_pricing_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GetPricing extends StatelessWidget {
  const GetPricing({super.key});

  @override
  Widget build(BuildContext context) {
    GetPricingController getPricingController = Get.put(GetPricingController());
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            getPricingController.isLoading.value = true;
            log('start');
          },
          onPageFinished: (String url) {
            if (getPricingController.isFirst.value) {
              getPricingController.isFirst.value = false;
            } else {
              getPricingController.isLoading.value = false;
              getPricingController.isFirst.value = true;
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
      ..loadRequest(Uri.parse("https://api.leadconnectorhq.com/widget/bookings/streamstekbooking"));
    return Obx(
          () => Scaffold(
        body: Stack(
          children: [
            WebViewWidget(controller: controller),
            getPricingController.isLoading.value
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
