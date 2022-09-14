import 'dart:io';

import 'package:amorium/common/reposiory/common_firebase_storage_repository.dart';
import 'package:amorium/common/utils/utils.dart';
import 'package:amorium/models/user_model.dart';
import 'package:amorium/screens/auth/user_photos_screen.dart';
import 'package:amorium/screens/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  Future<void> sendUserData({
    required String firstName,
    required String lastName,
    required String email,
    required String sex,
    required String preference,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      UserModel user = UserModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        sex: sex,
        preference: preference,
        phoneNumber: auth.currentUser!.phoneNumber as String,
        profilePhoto: '',
      );

      await firestore.collection('users').doc(uid).set(user.toMap());

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamedAndRemoveUntil(
        UserPhotosScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  Future<void> saveImages({
    required List<File?> images,
    required BuildContext context,
    required ProviderRef ref,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      for (int i = 0; i < images.length; i++) {
        if (images[i] != null) {
          await ref
              .read(commonFirebaseStorageRepositoryProvider)
              .storeFileToFirebase('images/$uid/$i', images[i]!);
        }
      }

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
