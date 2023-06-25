import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:need_help/data/api/model/api_user.dart';

class FirebaseService {
  final fbfAuthInstance = FirebaseAuth.instance;
  final fbInstance = FirebaseFirestore.instance;
  String? _verificationId;
  String? _phone;

  Future<ApiRealUser?> getUser(String id) async {
    final fbUserCollection = fbInstance.collection('users');
    final resultData = <String, dynamic>{
      'id': id,
    };

    final docSnap = await fbUserCollection.doc(id).get();
    final data = docSnap.data();

    if (data != null) {
      resultData.addAll(data);
      return ApiRealUser.fromApi(resultData);
    }

    return null;
  }

  Future<void> updateUser(ApiRealUser user) async {
    final fbUserCollection = fbInstance.collection('users');

    fbUserCollection.doc(user.id).update(user.toApi());
  }

  Future<void> verifyPhoneNumber({
    required String phone,
    required VoidCallback codeSended,
    required ValueChanged<Exception> errorHandler,
  }) async {
    _phone = phone;
    await fbfAuthInstance.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? forceResendingToken) {
        _verificationId = verificationId;
        codeSended.call();
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async =>
          await fbfAuthInstance.signInWithCredential(phoneAuthCredential),
      verificationFailed: errorHandler,
    );
  }

  Future<void> signInWithCredential(String smsCode) async {
    final credentials = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: smsCode);

    await fbfAuthInstance.signInWithCredential(credentials);
  }

  Future<void> signOut() async {
    await fbfAuthInstance.signOut();
  }

  Future<void> createUser({
    required String nickname,
    String? firstname,
    String? lastname,
    String? avatarUrl,
  }) async {
    fbInstance.collection('users').doc().set({
      'phone': _phone,
    });
  }

  Future<bool> isAuth() async {
    final curUser = fbfAuthInstance.currentUser;

    return curUser != null;
  }
}
