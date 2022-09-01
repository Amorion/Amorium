import 'package:amorium/repository/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(
    authRepository,
    ref,
  );
});

class AuthController {
  final Authrepository authRepository;
  final ProviderRef ref;

  AuthController(
    this.authRepository,
    this.ref,
  );

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(
      context,
      phoneNumber,
    );
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepository.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }
}
