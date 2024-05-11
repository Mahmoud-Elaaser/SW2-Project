import 'package:e_markting/features/auth/login/view/page/login_page.dart';
import 'package:flutter/material.dart';



class ChangePassBottom extends StatelessWidget {
  const ChangePassBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 0),
          child: ElevatedButton(
            onPressed: () { //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
              
              // Your logic for button press goes here
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Color.fromARGB(255, 3, 32, 112),                                                       
            ),
            child: const Text(
              "                    Change Password                  ",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
  height: 30,
  ),
        Container(
          padding: const EdgeInsets.only(top: 0, left: 0),
          child: ElevatedButton(
            onPressed:() {
              // ignore: use_function_type_syntax_for_parameters
               
            } 
              // Your logic for button press goes here
            ,
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Color.fromARGB(255, 3, 32, 112),
            ),
            child: const Text(
              "                              Cancel                            ",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
