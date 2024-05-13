import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_markting/features/dashboard/modules/users/model/repo/local_db_data.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<RegistrationState> {
  LoginCubit() : super(RegistrationInitial());

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  


      

  Future<void> onPressedConfirmButton(BuildContext context) async {
      var users = await (await DatabaseRepo.instance)
          .isUserExists(mailController.text, passwordController.text);
    if (formKey.currentState!.validate()&&users==true) {
      
        Navigator.pushNamed(context, 'DashbordPage', arguments: [
    mailController.text,
        ]);
        
      }
     else {
      log('invalid inputs');
    }
  }
}



