import 'package:amorium/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatListItem extends StatelessWidget {
  final String userId;
  const ChatListItem({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ChatScreen.routeName,
          arguments: userId,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
          ),
        ),
        child: Text(
          userId,
        ),
      ),
    );
  }
}
