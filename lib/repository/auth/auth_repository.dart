import 'dart:io';

import 'package:amorium/common/utils/utils.dart';
import 'package:amorium/models/user_model.dart';
import 'package:amorium/screens/auth/otp_screen.dart';
import 'package:amorium/screens/auth/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => Authrepository(
    FirebaseAuth.instance,
    FirebaseFirestore.instance,
  ),
);

class Authrepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  Authrepository(this.auth, this.firestore);

  Future<UserModel?> getCurrentUserData() async {
    final userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();
    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          if (!Platform.isAndroid) {
            await auth.signInWithCredential(credential);
          }
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((verificationId, forceResendingToken) async {
          Navigator.of(context).pushNamed(
            OTPScreen.routeName,
            arguments: verificationId,
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );

      await auth.signInWithCredential(phoneAuthCredential);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamedAndRemoveUntil(
        SplashScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
