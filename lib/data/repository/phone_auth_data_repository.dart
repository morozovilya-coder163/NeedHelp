import 'package:flutter/foundation.dart';
import 'package:need_help/domain/repository/phone_auth_repo.dart';

import '../api/api_util.dart';

class PhoneAuthDataRepository extends PhoneAuthRepository {
  final ApiUtil _apiUtil;

  PhoneAuthDataRepository(this._apiUtil);

  @override
  Future<void> sidnInWithCredentials(String smsCode) async {
    await _apiUtil.signInWithCredential(smsCode);
  }

  @override
  Future<void> verifyPhoneNumber({
    required String phone,
    required VoidCallback codeSended,
    required ValueChanged<Exception> errorHandler,
  }) async {
    await _apiUtil.verifyPhoneNumber(
      phone: phone,
      codeSended: codeSended,
      errorHandler: errorHandler,
    );
  }

  @override
  Future<void> signOut() async {
    return await _apiUtil.signOut();
  }

  @override
  Future<bool> isAuth() async {
    return await _apiUtil.isAuth();
  }

  @override
  Future<void> createUser({
    required String nickname,
    String? firstname,
    String? lastname,
    String? avatarUrl,
  }) async {
    return await _apiUtil.createUser(
      nickname: nickname,
      firstname: firstname,
      lastname: lastname,
      avatarUrl: avatarUrl,
    );
  }
}
