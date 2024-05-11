// ignore_for_file: unnecessary_const

import 'package:e_markting/features/auth/Registration/view/page/registration_page.dart';
import 'package:e_markting/features/auth/change%20password/view/page/changepass_page.dart';
import 'package:e_markting/features/auth/login/view/page/login_page.dart';
import 'package:e_markting/features/auth/onboarding/view/page/onboarding_page.dart';
import 'package:e_markting/features/auth/verfication/view/page/verfication_page.dart';
import 'package:e_markting/features/dashboard/modules/new_product/view/page/new_product_page.dart';
import 'package:e_markting/features/dashboard/modules/users/view/page/user_page.dart';
import 'package:e_markting/features/dashboard/view/page/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRoutes {
  MyRoutes(bool x);
  static get x => null;
  
  /*static List<Route> initRoutes = [
    MaterialPageRoute<dynamic>(
      builder: m(x),

    )
  ];*/
  static List<Route> initRoutes(bool x) {
  return [
    MaterialPageRoute<dynamic>(
     builder: (BuildContext context) => const OnBoardingPage(),
  //    builder: (BuildContext context) => const DashboardPage(),
    /*  builder: (BuildContext context) {
        return FutureBuilder<Builder>(
          future: m(x),
          builder: (BuildContext context, AsyncSnapshot<Builder> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return snapshot.data!;
              } else {
                return const CircularProgressIndicator();
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        );
      },*/
    )
  ];
}


    //   
    
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        final List data = settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => LoginPage(),
        );
      case 'registration':
        final List data = settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => RegistrationPage(),
        );
      case 'verfiction':
        final List data = settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => VerificationPage(),
        );
      case 'change password':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ChangePassPage(),
        );
      case 'DashbordPage':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const DashboardPage(),
        );
      case 'dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case 'new_product':
        return MaterialPageRoute(builder: (_) => const NewProductPage());
      case 'users':
        return MaterialPageRoute(builder: (_) => const UserPage());

      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OnBoardingPage(),
        );
    }
  }
static Future<Builder> m(bool x) async {
  if (x == false) {
    return Builder(
      builder: (BuildContext context) => const DashboardPage(),
      
    );
  } else {
    return Builder(
      builder: (BuildContext context) => const OnBoardingPage(),
    );
  }
}}