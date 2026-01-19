import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HablandoSicaApp());
}

class HablandoSicaApp extends StatelessWidget {
  const HablandoSicaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebOnlyPage(),
    );
  }
}

class WebOnlyPage extends StatefulWidget {
  const WebOnlyPage({super.key});

  @override
  State<WebOnlyPage> createState() => _WebOnlyPageState();
}

class _WebOnlyPageState extends State<WebOnlyPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse('https://hablandosica.com/'));
  }

  Future<bool> _onWillPop() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: WebViewWidget(controller: _controller),
      ),
    );
  }
}
