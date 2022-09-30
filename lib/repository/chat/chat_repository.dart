import 'package:amorium/models/chat_list_item_model.dart';
import 'package:amorium/models/message_model.dart';
import 'package:amorium/models/user_model.dart';
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
      "members": [senderID, recieverID],
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

  Stream<List<ChatListItemModel>> getChats() {
    return firestore
        .collection('chats')
        .where('members', arrayContains: auth.currentUser!.uid)
        .snapshots()
        .asyncMap((chatSnapshots) {
      List<ChatListItemModel> chats = [];

      for (var chatSnapshot in chatSnapshots.docs) {
        chats.add(
          ChatListItemModel.fromMap({
            ...chatSnapshot.data(),
            'matchID': chatSnapshot.id,
          }),
        );
      }
      return chats;
    });
  }

  Future<UserModel> getUserFromID(String id) async {
    final userDoc = await firestore.collection('users').doc(id).get();

    return UserModel.fromMap(userDoc.data()!);
  }

  Stream<List<MessageModel>> getMessages(String match) {
    return firestore
        .collection('chats')
        .doc(match)
        .collection('messages')
        .orderBy('timestamp')
        .snapshots()
        .asyncMap((messagesDocs) {
      List<MessageModel> messages = [];

      for (var messageDoc in messagesDocs.docs) {
        messages.add(
          MessageModel.fromMap(
            messageDoc.data(),
          ),
        );
      }
      return messages;
    });
  }
}
