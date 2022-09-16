import 'package:amorium/screens/home/widgets/bottom_bar.dart';
import 'package:amorium/screens/home/widgets/card_user.dart';
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
  bool modalOpened = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height * 0.8,
            child: modalOpened ? const Swiper() : const CardUser(),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                modalOpened = !modalOpened;
              });
            },
            child: const Text("Change"),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
