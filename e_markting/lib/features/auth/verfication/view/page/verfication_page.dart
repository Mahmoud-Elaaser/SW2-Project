import 'package:e_markting/core/context.dart';
import 'package:e_markting/features/auth/verfication/controller/cubit/verification_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class VerificationPage extends StatelessWidget {
   // ignore: use_super_parameters
   VerificationPage({Key? key}) : super(key: key);

   Image image = const Image(image: AssetImage('assets/images/logo.png'),height: 100,width: 100,);

  @override
  
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
          final VerificationCubit cubit = context.read<VerificationCubit>();
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const SizedBox(height: 0),
              image,
              const Text("Verfiction Code",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
              const SizedBox(height: 40),
                PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 5,
                  obscureText: true,
                  obscuringCharacter: '*',
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: context.width / 6,
                    fieldWidth: context.width / 6,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.grey,
                    inactiveColor: Colors.black,
                    activeColor: Colors.black,
                    selectedFillColor: Colors.black,
                    fieldOuterPadding: EdgeInsets.only(right: context.width / 30),
                  ),
                  cursorColor: Colors.white,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: cubit.pinCodeController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  onChanged: (value) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () => cubit.onTapConfirm(context),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Color.fromARGB(255, 3, 32, 112),
                    ),
                    child: const Text(
                      "    Confirm    ",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
