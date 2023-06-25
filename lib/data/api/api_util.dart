import 'package:flutter/material.dart';
import 'package:need_help/data/api/service/service.dart';
import 'package:need_help/data/mapper/user_mapper.dart';
import 'package:need_help/domain/model/user.dart';

class ApiUtil {
  const ApiUtil(
    this._firebaseService,
  );

  final FirebaseService _firebaseService;

  Future<RealUser?> getUser(String id) async {
    final apiRealUser = await _firebaseService.getUser(id);

    if (apiRealUser != null) {
      return UserMapper.fromApi(apiRealUser);
    }

    return null;
  }

  Future<void> updateUser(RealUser user) async {
    final apiRealUser = UserMapper.toApi(user);

    await _firebaseService.updateUser(apiRealUser);
  }

  Future<void> verifyPhoneNumber({
    required String phone,
    required VoidCallback codeSended,
    required ValueChanged<Exception> errorHandler,
  }) async {
    await _firebaseService.verifyPhoneNumber(
      phone: phone,
      codeSended: codeSended,
      errorHandler: errorHandler,
    );
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
  }

  Future<void> signInWithCredential(String smsCode) async {
    await _firebaseService.signInWithCredential(smsCode);
  }

  Future<bool> isAuth() async {
    return await _firebaseService.isAuth();
  }

  Future<void> createUser({
    required String nickname,
    String? firstname,
    String? lastname,
    String? avatarUrl,
  }) async {
    return await _firebaseService.createUser(
      nickname: nickname,
      firstname: firstname,
      lastname: lastname,
      avatarUrl: avatarUrl,
    );
  }
}
