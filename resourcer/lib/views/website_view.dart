import 'package:flutter/material.dart';
import 'package:resourcer/helper/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsiteView extends StatefulWidget {
  const WebsiteView({required this.websiteData, super.key});
  final Map<String, dynamic> websiteData;

  @override
  State<WebsiteView> createState() => _WebsiteViewState();
}

class _WebsiteViewState extends State<WebsiteView> {
  @override
  Widget build(BuildContext context) {
    final WebView webView = WebView(
      url: widget.websiteData['url'],
    );
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Color.fromRGBO(0, 94, 205, 1.0),
            shadows: [
              Shadow(
                blurRadius: 0.5,
                color: Colors.black,
                offset: Offset(
                  0.3,
                  0.3,
                ),
              ),
            ]),
        actions: <Widget>[
          IconButton(
            iconSize: 25,
            icon: const Icon(
              Icons.replay_outlined,
              color: Color.fromRGBO(0, 94, 205, 1.0),
            ),
            onPressed: () {
              // do something
            },
          ),
          const SizedBox(
            width: 3,
          ),
          IconButton(
            iconSize: 40,
            icon: const Icon(
              Icons.arrow_left,
              color: Color.fromRGBO(0, 94, 205, 1.0),
            ),
            onPressed: () {
              // do something
            },
          ),
          const SizedBox(
            width: 3,
          ),
          IconButton(
            iconSize: 40,
            icon: const Icon(
              Icons.arrow_right,
              color: Color.fromRGBO(0, 94, 205, 1.0),
            ),
            onPressed: () {
              // do something
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(216, 250, 255, 1.0),
        elevation: 0,
        title: RichText(
            text: TextSpan(
          text: '',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          children: [
            TextSpan(
              text: widget.websiteData['name'],
              style: const TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(0, 94, 205, 1.0),
              ),
            )
          ],
        )),
      ),
      body: WebViewWidget(
        controller: webView.getController(),
      ),
    );
  }
}
