import 'package:amorium/screens/home/widgets/bottom_bar.dart';
import 'package:amorium/screens/home/widgets/swiper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Swiper(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
