import 'package:flutter/material.dart';
import 'package:e_markting/core/validation.dart';

// ignore_for_file: annotate_overrides

// ignore_for_file: must_be_immutable


class RequriedChangePassData extends StatelessWidget {
   RequriedChangePassData({super.key});

  
  Widget build(BuildContext context) {
    return Column(
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
      
        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR10F2IoAY9w-UygCY-FOLgWtwCbW1TbBwUuXPnOb1aIg&s",height: 100,width: 100,),
            const Text("Change password",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
        const SizedBox(height: 30),
    
          ///Email
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          validator: MyValidation().nameValidate,
          decoration: decoration.copyWith(hintText: 'Email',prefixIcon: const Icon(Icons.email_outlined)),
        ),
        const SizedBox(height: 30),
        ///Password
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          validator: MyValidation().passwordValidate,
          decoration: decoration.copyWith(suffixIcon: const Icon(Icons.remove_red_eye),
          prefixIcon: const Icon(Icons.password),hintText: 'Password')
          ,obscureText: true,obscuringCharacter: "#",),
        const SizedBox(height: 30),
        ///Confirm Password
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          validator: MyValidation().passwordValidate,
          decoration: decoration.copyWith(suffixIcon: const Icon(Icons.remove_red_eye),
          prefixIcon: const Icon(Icons.password),hintText: 'Confirm Password')
          ,obscureText: true,obscuringCharacter: "#",)
      ],
    );
  }

  InputDecoration decoration = InputDecoration(
      //label: Text("Password"),
      floatingLabelBehavior: FloatingLabelBehavior.always,    
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange, width: 5),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 17, 0, 255), width: 5),
          borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 243, 2, 2), width: 5),
          borderRadius: BorderRadius.circular(10)));
}
