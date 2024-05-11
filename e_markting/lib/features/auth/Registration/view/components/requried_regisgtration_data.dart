import 'dart:typed_data';

import 'package:e_markting/features/auth/Registration/controller/cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_markting/core/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore_for_file: annotate_overrides

// ignore_for_file: must_be_immutable

class RequriedRegistrationData extends StatelessWidget {
  RequriedRegistrationData({super.key, required this.controller});
  final RegistrationCubit controller;
Image image = Image(image: AssetImage('assets/images/logo.png'),height: 100,width: 100,);

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
        final  RegistrationCubit controller = context.read<RegistrationCubit>();

          return Form(
            key: controller.formKey,
            
            child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              image,
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              ///Frist Name

              TextField(
                  controller:controller.UserNameController,
                  keyboardType: TextInputType.name,
                  decoration: decoration.copyWith(
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'User Name')),

              const SizedBox(height: 20),

              ///Email
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.EmailController,
                keyboardType: TextInputType.name,
                validator: MyValidation().nameValidate,
                decoration: decoration.copyWith(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined)),
              ),
              const SizedBox(height: 20),

              ///Password
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.PasswordController,
                keyboardType: TextInputType.name,
                validator: MyValidation().passwordValidate,
                decoration: decoration.copyWith(
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    prefixIcon: const Icon(Icons.password),
                    hintText: 'Password'),
                obscureText: true,
                obscuringCharacter: "#",
              ),
              const SizedBox(height: 20),

              ///Confirm Password
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.ConfirmPassController,
                keyboardType: TextInputType.name,
                validator: MyValidation().passwordValidate,
                decoration: decoration.copyWith(
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    prefixIcon: const Icon(Icons.password),
                    hintText: 'Confirm Password'),
                obscureText: true,
                obscuringCharacter: "#",
              )
            ],
          ));
        },
      ),
    );
  }

  InputDecoration decoration = InputDecoration(
      //label: Text("Password"),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange, width: 5),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 17, 0, 255), width: 5),
          borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 243, 2, 2), width: 5),
          borderRadius: BorderRadius.circular(10)));
}