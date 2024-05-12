import 'package:e_markting/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key, required this.controller});
  OnboardingControllerCubit controller;
  @override
  Widget build(BuildContext context) {
    padding: EdgeInsets.all(16.0);
    return Column(
      
      children: [
        
        SizedBox(height: 30,),
      
        
        Expanded(
          child: BlocProvider<OnboardingControllerCubit>.value(
            value: controller,
            child: BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
              builder: (context, state) {
                OnboardingControllerCubit controller = context.read<OnboardingControllerCubit>();

                return PageView(
                  
                  
                  controller: controller.pageController,
                  
                  children: List.generate(controller.data.length, (index) {
                    return Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        ///image
                        Image.asset(controller.data[index].image),

                        ///title
                        Text(
                          controller.data[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: controller.data[index].color,
                          ),
                        ),

                        ///subtitle
                        Container(
                           
                            
                  
           
            alignment: Alignment.center,
                          
                       child:  Text(
                          controller.data[index].subtitle,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),textAlign: TextAlign.center,
                        ),),
                      ],
                    );
                  }),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
