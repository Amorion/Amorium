import 'package:amorium/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInformationRepository = Provider(
  (ref) => UserInformationRepository(
    FirebaseAuth.instance,
    FirebaseFirestore.instance,
  ),
);

class UserInformationRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  UserInformationRepository(this.auth, this.firestore);

  Future<UserModel?> getCurrentUserData() async {
    final userData =
        await firestore.collection('users').doc(auth.currentUser!.uid).get();
    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }
}
