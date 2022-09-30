import 'package:amorium/controller/chat/chat_controller.dart';
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
          const Expanded(
            child: Text("Chat"),
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
