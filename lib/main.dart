import 'package:amorium/firebase_options.dart';
import 'package:amorium/routes.dart';
import 'package:amorium/screens/auth/login_screen.dart';
import 'package:amorium/screens/auth/user_information_screen.dart';
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

class Amorium extends StatelessWidget {
  const Amorium({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amorium',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const UserInformationScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
