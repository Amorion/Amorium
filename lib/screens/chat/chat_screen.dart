import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String recieverId;
  const ChatScreen({Key? key, required this.recieverId}) : super(key: key);
  static const String routeName = '/chat-screen';
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recieverId),
      ),
    );
  }
}
