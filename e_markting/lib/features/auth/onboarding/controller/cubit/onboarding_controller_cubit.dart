import 'package:bloc/bloc.dart';
import 'package:e_markting/features/auth/Registration/view/page/registration_page.dart';
import 'package:e_markting/features/auth/onboarding/model/onbording_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());
  int methodCallCount = 0; // Counter variable

  PageController pageController = PageController();




  void onChangeToNext(BuildContext context) {
    methodCallCount++;
    if (methodCallCount < data.length) {
      // Increment the method call count
      pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.linear);
    }
    else{
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistrationPage()));

    }
  }

  Future<void> onCallSkip(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('onboarding', true);
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const RegistrationPage(),
      ),
    );
  }

  List<OnboardingModel> data = [
    OnboardingModel(
      image: 'assets/images/logo.png',
      title: 'First',
      subtitle:
          'Hello, our dear customer, we hope you enjoy this experience and achieve the desired benefit',
      color: Colors.green,
    ),
    OnboardingModel(
      image: 'assets/images/logo.png',
      title: 'Second',
      subtitle:
          "We will help you sell your products and buy other people's products with ease",
      color: Colors.blue,
    ),
    OnboardingModel(
      image: 'assets/images/logo.png',
      title: 'Third',
      subtitle:
          'Please help us and yourself by adhering to the rules and not trying to cheat or defraud',
      color: Colors.red,
    ),
  ];
}
