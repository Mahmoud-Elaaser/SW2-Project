import 'package:e_markting/core/context.dart';
import 'package:e_markting/features/auth/login/controller/cubit/login_cubit.dart';
import 'package:e_markting/features/auth/login/view/components/bottom_widget.dart';
import 'package:e_markting/features/auth/login/view/components/required_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, RegistrationState>(
        builder: (context, state) {
          final LoginCubit controller = context.read<LoginCubit>();
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: RequiredDataWidget(
                controller: controller,
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: context.height / 4,
              child: BottomNavigationWiget(
                controller: controller,
              ),
            ),
          );
        },
      ),
    );
  }
}
