import 'package:amorium/screens/home/widgets/app_bar.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            SizedBox(
              // decoration: BoxDecoration(border: Border.all(width: 4)),
              height: size.height * 0.75,
              child: const Swiper(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
