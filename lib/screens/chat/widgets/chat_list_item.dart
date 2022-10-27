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
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(76, 252, 134, 123),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.only(
            left: 15.0,
            top: 20.0,
            bottom: 20.0,
            right: 25.0,
          ),
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
                    "https://www.aljazeera.com/wp-content/uploads/2022/01/2016-09-20T000000Z_845319616_S1BEUCKKIQAB_RTRMADP_3_UN-ASSEMBLY.jpg?resize=1800%2C1800",
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Gilroy",
                    ),
                  ),
                  const Text(
                    "Last Message",
                    style: TextStyle(fontSize: 12, fontFamily: "Gilroy"),
                  )
                ],
              ),
              const Spacer(),
              const Text(
                "1m",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
