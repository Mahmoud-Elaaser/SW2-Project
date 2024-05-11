import 'package:e_markting/core/validation.dart';
import 'package:e_markting/features/auth/login/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequiredDataWidget extends StatelessWidget {
  RequiredDataWidget({super.key, required this.controller});

  final LoginCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<LoginCubit, RegistrationState>(
        builder: (context, state) {
          LoginCubit controller = context.read<LoginCubit>();

          return Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                ///logo
                const Text(
                  "NERD",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),

                ///mail
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.mailController,
                    keyboardType: TextInputType.name,
                    validator: MyValidation().nameValidate,
                    decoration: decoration.copyWith(
                        labelText: 'mail', hintText: 'xxxx@gmail.com', prefixIcon: const Icon(Icons.mail)),
                  ),
                ),

                ///password

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.text,
                    validator: MyValidation().passwordValidate,
                    decoration: decoration.copyWith(
                      labelText: 'password',
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    obscureText: true,
                    obscuringCharacter: "*",
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
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
