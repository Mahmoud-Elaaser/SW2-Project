import 'package:e_markting/core/context.dart';
import 'package:e_markting/features/auth/Registration/view/page/registration_page.dart';
import 'package:e_markting/features/auth/change%20password/view/page/ChangePass_page.dart';
import 'package:e_markting/features/auth/login/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({Key? key, required this.controller});

  final LoginCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<LoginCubit, RegistrationState>(
        builder: (context, state) {
          final LoginCubit controller = context.read<LoginCubit>();

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 0,
                  left: 0,
                ),
                child: ElevatedButton(
                  onPressed: () => controller.onPressedConfirmButton(context),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(255, 3, 32, 112),
                  ),
                  child: const Text(
                    "                                Sign In                                 ",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "have no account ? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistrationPage()));
                    },
                    child:  const Text(
                      "Registration",
                      style:  TextStyle(
                        color: Color.fromARGB(255, 126, 117, 231),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 3,
                        decorationColor: Color.fromARGB(255, 22, 2, 248),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Forget Password ? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangePassPage()));
                    },
                    child:  const Text(
                      "Change Password",
                  style:  TextStyle(
                        color: Color.fromARGB(255, 126, 117, 231),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 3,
                        decorationColor: Color.fromARGB(255, 22, 2, 248),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
