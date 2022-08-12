import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello there!")),
      body: Center(
        child: Text(
          "Welcome back"
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {},
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
    );
  }
}
