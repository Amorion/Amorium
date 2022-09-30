import 'package:amorium/controller/chat/chat_controller.dart';
import 'package:amorium/models/chat_list_item_model.dart';
import 'package:amorium/screens/chat/widgets/chat_list_item.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Matches",
        ),
        actions: [
          IconButton(
            onPressed: addChat,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder(
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
                        } else {
                          return const Text("Loading");
                        }
                      });
                }).toList(),
              );
            }
          }
        },
        stream: ref.read(chatControllerProvider).getChats(),
      ),
    );
  }
}
