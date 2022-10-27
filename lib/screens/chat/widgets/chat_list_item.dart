import 'package:amorium/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatListItem extends StatelessWidget {
  final String matchID;
  final String displayName;

  const ChatListItem(
      {Key? key, required this.matchID, required this.displayName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ChatScreen.routeName,
          arguments: {
            "matchID": matchID,
            "displayName": displayName,
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9999999),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(9999999)),
                  child: Image.network(
                    "https://cdn.discordapp.com/emojis/1034899484083236864.webp?size=44&quality=lossless",
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(displayName),
              const Spacer(),
              const Text("1m"),
            ],
          ),
        ),
      ),
    );
  }
}
