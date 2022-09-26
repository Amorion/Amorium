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

  Future<String> sendMessage() async {
    // TODO
    return "Sent";
  }
}
