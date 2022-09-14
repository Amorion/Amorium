import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            icon: const Icon(CupertinoIcons.star),
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
            icon: const Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
