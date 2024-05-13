import 'package:e_markting/core/context.dart';
import 'package:e_markting/features/auth/change%20password/controller/cubit/changePass_cubit.dart';
import 'package:e_markting/features/auth/change%20password/view/components/bottom_widget.dart';
import 'package:e_markting/features/auth/change%20password/view/components/required_data_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChangePassPage extends StatelessWidget {
  const ChangePassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePassCubit>(
      create: (context) => ChangePassCubit(),
      child: BlocBuilder<ChangePassCubit, ChangePassState>(
        builder: (context, state) {
          final ChangePassCubit controller = context.read<ChangePassCubit>();
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: RequiredDataWidget(
                controller: controller,
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: context.height / 4,
              child: BottomNavigationWidget(
                controller: controller,
              ),
            ),
          );
        },
      ),
    );
  }
}
