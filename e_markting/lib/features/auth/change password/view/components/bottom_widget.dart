import 'package:e_markting/core/context.dart';
import 'package:e_markting/features/auth/change%20password/controller/cubit/changePass_cubit.dart';
import 'package:e_markting/features/auth/login/view/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({Key? key, required this.controller});

  final ChangePassCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<ChangePassCubit, ChangePassState>(
        builder: (context, state) {
          final ChangePassCubit controller = context.read<ChangePassCubit>();

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
                    "                 Change Password                   ",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color.fromARGB(255, 3, 32, 112),
                ),
                child: const Text(
                  "                             Cancel                            ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
