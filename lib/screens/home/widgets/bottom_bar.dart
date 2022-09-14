import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.heart_fill),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.chat_bubble_2_fill),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }
}
