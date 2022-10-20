import 'package:amorium/screens/auth/login_screen.dart';
import 'package:amorium/screens/chat/chat_list_screen.dart';
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
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: 30.0,
      ),
      // alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.settings, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.star, size: 30),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(99999)),
            height: 60,
            width: 60,
            child: const Icon(
              Icons.sync,
              color: Colors.white,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                ChatListScreen.routeName,
              );
            },
            icon: const Icon(CupertinoIcons.heart, size: 30),
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
            icon: const Icon(CupertinoIcons.person, size: 30),
          ),
        ],
      ),
    );
  }
}
