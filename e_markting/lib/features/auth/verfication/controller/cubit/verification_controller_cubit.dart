import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'verification_controller_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());
    TextEditingController UserNameController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  final String validCode = '22222';
  void onTapConfirm(BuildContext context) {
    if (pinCodeController.text == validCode) {
      Navigator.pushNamed(context, 'login',
    arguments: [
    UserNameController.text,
      ]);
    } else {
      print("invalid");
    }
  }
}
