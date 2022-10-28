import 'package:after_layout/after_layout.dart';
import 'package:amorium/controller/auth/auth_controller.dart';
import 'package:amorium/screens/auth/user_information_screen.dart';
import 'package:amorium/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/splash-screen';

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  void doSomething() {
    ref.watch(userDataProvider).when(
        data: (user) {
          if (user == null) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                UserInformationScreen.routeName, (route) => false);
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(
                HomeScreen.routeName, (route) => false);
          }
        },
        error: (err, trace) {},
        loading: () {});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    doSomething();
  }
}
