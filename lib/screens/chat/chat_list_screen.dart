import 'package:amorium/controller/chat/chat_controller.dart';
import 'package:amorium/models/chat_list_item_model.dart';
import 'package:amorium/screens/chat/widgets/chat_list_item.dart';
import 'package:amorium/screens/home/widgets/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListScreen extends ConsumerStatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);
  static const String routeName = '/chat-list-screen';

  @override
  ConsumerState<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends ConsumerState<ChatListScreen> {
  bool messageSelected = true;

  void toggleList() {
    setState(() {
      messageSelected = !messageSelected;
    });
  }

  Future<String> addChat() async {
    return ref.read(chatControllerProvider).addChat(
          recieverID: "4fM3xsD0ZIN2F6IjMAKqheutzGu1",
        );
  }

  @override
  void initState() {
    super.initState();
  }

  Future<String> getUserName(List<dynamic> members) async {
    final currUserId = FirebaseAuth.instance.currentUser?.uid;
    if (members[0] == currUserId) {
      return (await ref.read(chatControllerProvider).getUserFromID(members[1]))
          .firstName;
    } else {
      return (await ref.read(chatControllerProvider).getUserFromID(members[0]))
          .firstName;
    }
  }

  Widget getChatList() {
    var chatList = StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          List<ChatListItemModel> chats =
              snapshot.data as List<ChatListItemModel>;
          if (chats.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://img.freepik.com/free-vector/no-data-concept-illustration_114360-536.jpg?w=2000',
                    height: 300,
                    width: 300,
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: chats.map((chat) {
                return FutureBuilder(
                    future: getUserName(chat.members),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ChatListItem(
                          matchID: chat.matchID!,
                          displayName: snapshot.data as String,
                        );
                      }
                      return Container();
                    });
              }).toList(),
            );
          }
        }
      },
      stream: ref.read(chatControllerProvider).getChats(),
    );
    return chatList;
  }

  Widget appBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 40, top: 75, right: 40),
      child: const Text(
        "Matches",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontFamily: "Gilroy",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: size.height * 0.15,
                            width: size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.purple,
                            ),
                          ),
                          Container(
                            height: size.height * 0.15,
                            width: size.height * 0.15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.purple),
                          ),
                          Container(
                            height: size.height * 0.15,
                            width: size.height * 0.15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.purple),
                          )
                        ],
                      ),
                      Positioned(
                        // left: size.width * 0.3,
                        child: Container(
                          height: size.height * 0.2,
                          width: size.height * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Someone Liked you",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Gilroy",
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: toggleList,
                  child: Text(
                    "Messages",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight:
                          (messageSelected) ? FontWeight.w700 : FontWeight.w200,
                      fontFamily: "Gilroy",
                    ),
                  ),
                ),
                TextButton(
                  onPressed: toggleList,
                  child: Text(
                    "Interactions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: (!messageSelected)
                          ? FontWeight.w700
                          : FontWeight.w200,
                      fontFamily: "Gilroy",
                    ),
                  ),
                ),
              ],
            ),
            messageSelected ? getChatList() : Container(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
