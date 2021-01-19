import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuth {
  final String phoneNo;
  String verificationId;
  final FirebaseAuth auth = FirebaseAuth.instance;
  PhoneAuth({this.phoneNo});

  Future<void> verifyPhone(BuildContext context) async {
    final verificationCompleted = (AuthCredential credential) async {
      final res=await auth.signInWithCredential(credential);
      Navigator.of(context).pop();
    };
    final verificationFailed = (FirebaseAuthException authException) {
      print('Auth Exception is ${authException.message} ');
    };
    final codeSent=(String verificationId, [int forceResendingToken]) async {
      print('verification id is $verificationId');
      this.verificationId=verificationId;
    };
    final codeAutoRetrievalTimeOut = (String verificationId) {
      print("timeOut");
      this.verificationId = verificationId;
    };
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 30),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeOut);
  }
  signIn(context,{@required String smsOTP}) {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsOTP);
      auth.signInWithCredential(credential);
      Navigator.of(context).pop();
    }catch(e){
      print(e);
    }
  }
  signOut(){
    auth.signOut();
  }
}
