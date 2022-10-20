import 'package:amorium/common/screens/loader.dart';
import 'package:amorium/controller/chat/chat_controller.dart';
import 'package:amorium/models/message_model.dart';
import 'package:amorium/screens/chat/widgets/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String matchID;
  final String displayName;
  const ChatScreen({
    Key? key,
    required this.matchID,
    required this.displayName,
  }) : super(key: key);

  static const String routeName = '/chat-screen';
  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _message = TextEditingController();
  final ScrollController messageController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  Future<String> sendMessage() async {
    if (_message.text.isNotEmpty) {
      final msg = _message.text;
      setState(() {
        _message.text = "";
      });
      return ref.read(chatControllerProvider).sendMessage(
            message: msg,
            matchID: widget.matchID,
          );
    }
    return "No";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.displayName),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream:
                  ref.read(chatControllerProvider).getMessages(widget.matchID),
              builder: (context, snapshot) {
                final userID = FirebaseAuth.instance.currentUser?.uid;

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Loader();
                }

                if (snapshot.hasData) {
                  final messages = snapshot.data;
                  return ListView.builder(
                    controller: messageController,
                    itemCount: messages?.length,
                    itemBuilder: (context, index) {
                      if (messages?[index].senderID == userID) {
                        return SentMessage(message: messages?[index].message);
                      } else {
                        return RecievedMessage(
                            message: messages?[index].message);
                      }
                    },
                  );
                }
                return Container();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.add),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 10.0,
                    ),
                    child: TextField(
                      controller: _message,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type a message",
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
