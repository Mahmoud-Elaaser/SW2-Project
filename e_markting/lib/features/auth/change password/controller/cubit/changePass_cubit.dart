import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_markting/features/dashboard/modules/users/model/repo/local_db_data.dart';
import 'package:flutter/material.dart';

part 'changePass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit() : super(ChangePassInitial());

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfermController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> onPressedConfirmButton(BuildContext context) async {
    var users =
        await (await DatabaseRepo.instance).isEmailExists(mailController.text);
    if (formKey.currentState!.validate() &&
        users == true &&
        passwordController.text == passwordConfermController.text) {
      var users = await (await DatabaseRepo.instance)
          .updatePass(passwordController.text, mailController.text);
      log("message");
      Navigator.pushNamed(context, 'verfiction', arguments: [
        mailController.text,
      ]);
    } else {
      log('invalid inputs');
    }
  }
}
