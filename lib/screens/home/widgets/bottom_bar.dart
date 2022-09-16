import 'package:amorium/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      // alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.settings),
          ),
          IconButton(
            onPressed: () async {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const LoginScreen(),
                ),
                (route) => false,
              );
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(CupertinoIcons.person),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.home),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.heart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.chat_bubble),
          ),
        ],
      ),
    );
  }
}
