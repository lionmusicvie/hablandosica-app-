import 'package:flutter/material.dart';
import 'radio_page.dart';
import 'web_page.dart';
import 'now_playing_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = const [
    RadioPage(),
    WebPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[index],
          const Positioned(
            left: 12,
            right: 12,
            bottom: 90, // para no chocar con NavigationBar
            child: NowPlayingBar(),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.radio), label: 'Radio'),
          NavigationDestination(icon: Icon(Icons.public), label: 'Web'),
        ],
      ),
    );
  }
}
