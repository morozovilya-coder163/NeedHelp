import 'package:flutter/foundation.dart';

abstract class PhoneAuthRepository {
  Future<void> verifyPhoneNumber({
    required String phone,
    required VoidCallback codeSended,
    required ValueChanged<Exception> errorHandler,
  });

  Future<void> sidnInWithCredentials(String smsCode);

  Future<void> signOut();

  Future<bool> isAuth();

  Future<void> createUser({
    required String nickname,
    String? firstname,
    String? lastname,
    String? avatarUrl,
  });
}
