import 'package:amorium/models/user_model.dart';
import 'package:amorium/repository/auth/user_information_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInformationControllerProvider = Provider((ref) {
  final userInformationRepository = UserInformationRepository(
    FirebaseAuth.instance,
    FirebaseFirestore.instance,
  );
  return UserInformationController(userInformationRepository, ref);
});

class UserInformationController {
  final UserInformationRepository userInformationRepository;
  final ProviderRef ref;

  UserInformationController(this.userInformationRepository, this.ref);

  Future<UserModel?> getCurrentUserData() {
    return userInformationRepository.getCurrentUserData();
  }
}