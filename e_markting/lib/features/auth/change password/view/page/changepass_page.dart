import 'package:flutter/material.dart';
import 'package:e_markting/features/auth/change%20password/view/components/index.dart';
import 'package:e_markting/features/auth/change%20password/view/components/requred_changepass_data.dart';



class ChangePassPage extends StatelessWidget {
  const ChangePassPage ({super.key});

  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:RequriedChangePassData(),
        bottomNavigationBar: const SizedBox(height: 200,child:  ChangePassBottom(),),
      ),
    );
  }
}