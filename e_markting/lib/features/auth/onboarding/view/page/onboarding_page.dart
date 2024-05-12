import 'package:e_markting/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:e_markting/features/auth/onboarding/view/components/onboarding_body.dart';
import 'package:e_markting/features/auth/onboarding/view/components/onboarding_buttons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<OnboardingControllerCubit>(
        create: (context) => OnboardingControllerCubit(),
        child: BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
          builder: (context, state) {
            OnboardingControllerCubit controller = context.read<OnboardingControllerCubit>();
            return Scaffold(
              appBar: AppBar(
          title: Text("Welcome in our E-Markting App",style: TextStyle(
                            fontSize: 25,
                            
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 237, 240, 237),
                          ),),
          backgroundColor: Colors.blue,
        )
,
              body: OnboardingBody(
                controller: controller,
              ),
              bottomNavigationBar: OnboardingButtonWidget(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
