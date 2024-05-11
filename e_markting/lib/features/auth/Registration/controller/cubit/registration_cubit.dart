import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_markting/features/dashboard/modules/users/model/repo/local_db_data.dart';

import 'package:meta/meta.dart';

import 'package:flutter/material.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());
  TextEditingController UserNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConfirmPassController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> onPressedConfirmButton(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (PasswordController.text == ConfirmPassController.text) {
        // ignore: prefer_typing_uninitialized_variables
        var users = await (await DatabaseRepo.instance).insert(
            name: UserNameController.text,
            email: EmailController.text,
            pass: PasswordController.text,
            age: 10,
            address: 'address');

        Navigator.pushNamed(context, 'verfiction', arguments: [
          UserNameController.text,
        ]);
        log(UserNameController.text);
        log(EmailController.text);
        log(PasswordController.text);
        log(ConfirmPassController.text);
      }
    } else {
      log('invalid inputs');
    }
  }
}
