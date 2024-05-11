import 'package:e_markting/core/context.dart';
import 'package:e_markting/features/auth/login/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BottomNavigationWiget extends StatelessWidget {
  BottomNavigationWiget({super.key, required this.controller});

  final LoginCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<LoginCubit, RegistrationState>(
        builder: (context, state) {
          LoginCubit controller = context.read<LoginCubit>();

        return Column(children: [
            Container(
              padding: const EdgeInsets.only(
                top: 0,
                left: 0,
              ),
              child: ElevatedButton(
                onPressed:()=> 
                  controller.onPressedConfirmButton(context)
                ,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color.fromARGB(255, 3, 32, 112),
                ),
                child: const Text(
                  "                     Sign Up                     ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("have an account ? ",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text(
                  "login",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                      decorationColor: Colors.orange),
                )
              ],
            )
          ]);
        }));
  }
}
