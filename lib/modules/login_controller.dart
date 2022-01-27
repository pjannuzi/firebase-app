import 'package:fbaseapp/shared/components/error_dialog.dart';
import 'package:fbaseapp/shared/services/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  Storage storage = Storage();

  @observable
  bool isBusy = false;

  @observable
  String email = "";

  @observable
  String password = "";

  @action
  signin(BuildContext context) async {
    try {
      if (isBusy) return;
      isBusy = true;

      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential _user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      storage.setSignin(email, FirebaseAuth.instance.currentUser!.uid);
      _showDialog(context: context, error: 'Logou');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showDialog(context: context, error: 'Usuário não encontrado');
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _showDialog(context: context, error: 'Senha Incorreta');
        print('Wrong password provided for that user.');
      }
    } finally {
      isBusy = false;
    }
  }

  Future<void> _showDialog(
      {BuildContext? context, required String error}) async {
    return showDialog<void>(
      context: context!,
      barrierDismissible: false,
      builder: (context) => ErrorDialogWidget(error: error),
    );
  }
}
