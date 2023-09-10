import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView {
  WebViewController webViewController = WebViewController();
  String url;
  WebView({
    required this.url,
  });
  WebViewController getController() {
    webViewController
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )
      ..setBackgroundColor(
        Colors.white,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            log('inside onProgress');
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url))
      ..enableZoom(true)
      ..goBack();
    return webViewController;
  }
}
