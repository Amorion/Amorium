import 'package:amorium/common/screens/error_screen.dart';
import 'package:amorium/common/screens/loader.dart';
import 'package:amorium/controller/auth/auth_controller.dart';
import 'package:amorium/firebase_options.dart';
import 'package:amorium/routes.dart';
import 'package:amorium/screens/auth/login_screen.dart';
import 'package:amorium/screens/auth/user_information_screen.dart';
import 'package:amorium/screens/auth/user_photos_screen.dart';
import 'package:amorium/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: Amorium(),
    ),
  );
}

class Amorium extends ConsumerWidget {
  const Amorium({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Amorium',
      debugShowCheckedModeBanner: false,
      home: ref.watch(userDataProvider).when(data: (user) {
        if (user == null) {
          return const LoginScreen();
        }
        return const HomeScreen();
      }, error: (err, trace) {
        return ErrorScreen(
          error: err.toString(),
        );
      }, loading: () {
        return const Loader();
      }),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
