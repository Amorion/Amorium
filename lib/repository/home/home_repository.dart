import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(
    auth: FirebaseAuth.instance,
    firstore: FirebaseFirestore.instance,
  ),
);

class HomeRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firstore;

  HomeRepository({required this.auth, required this.firstore});
}
