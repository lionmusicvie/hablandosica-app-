import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatelessWidget {
  const WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://hablandosica.com'));

    return Scaffold(
      appBar: AppBar(title: const Text('hablandosica.com')),
      body: WebViewWidget(controller: controller),
    );
  }
}
