import 'dart:developer';

import 'package:fidooo_challenge/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> getToken() async => await _auth.currentUser?.getIdToken();

  Future signOut() => _auth.signOut();

  Future resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.message!}'),
        ),
      );
      return null;
    }
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset email sent')),
    );
  }

  Future<BaseAuthUser?> signInWithEmail(
    String email,
    String password,
  ) =>
      _signInOrCreateAccount(
        () => FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(),
          password: password,
        ),
      );

  Future<BaseAuthUser?> createAccountWithEmail(
    String email,
    String password,
  ) =>
      _signInOrCreateAccount(
        () => FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password,
        ),
      );

  Future<BaseAuthUser?> _signInOrCreateAccount(
      Future<UserCredential?> Function() signInFunc) async {
    try {
      final userCredential = await signInFunc();
      return userCredential == null
          ? null
          : FirebaseUser.fromUserCredential(userCredential);
    } on FirebaseAuthException catch (e) {
      log('AuthError: ${e.message!}');
      return null;
    }
  }
}
