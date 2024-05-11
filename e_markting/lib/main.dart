import 'package:device_preview/device_preview.dart';
import 'package:e_markting/core/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool onBording = sharedPreferences.getBool('OnBoardingPage') ?? false;

 

MaterialApp materialApp = MaterialApp(
   builder:DevicePreview.appBuilder,
    useInheritedMediaQuery: true,
    onGenerateRoute: MyRoutes.onGenerateRoute,
    onGenerateInitialRoutes: (_) => MyRoutes.initRoutes(onBording),
);

    //VerficationPage()
    //RegistrationPage()
    //ChangePassPage()
    //LoginPage()
  runApp(  DevicePreview(
      enabled: false,
      builder: (context) => materialApp, // Wrap your app
    ),);
}
