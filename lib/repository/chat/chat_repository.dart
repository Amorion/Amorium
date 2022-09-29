import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatRepositoryProvider = Provider(
  (ref) => ChatRepository(
    FirebaseAuth.instance,
    FirebaseFirestore.instance,
  ),
);

class ChatRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  ChatRepository(this.auth, this.firestore);

  Future<String> addChat({
    required String recieverID,
  }) async {
    final String? senderID = auth.currentUser?.uid;
    await firestore.collection('chats').add({
      "users": [senderID, recieverID],
    });
    return "";
  }

  Future<String> sendMessage({
    required String message,
    required String matchID,
  }) async {
    final String? senderID = auth.currentUser?.uid;
    final timestamp = FieldValue.serverTimestamp();

    await firestore
        .collection('chats')
        .doc(matchID)
        .collection('messages')
        .add({
      'message': message,
      'timestamp': timestamp,
      'senderID': senderID,
    });
    return "Sent";
  }
}
