import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';
import 'package:flutter_firebase/ui/buttons/primary_button.dart';
import 'package:flutter_firebase/ui/buttons/primary_outlined_button.dart';
import 'package:flutter_firebase/ui/textfields/primary_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x66D7F2FD),
                  Color(0xffD7F2FD),
                  Color(0xffD7F2FD),
                  Color(0xffD7F2FD),
                ]
              )
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryTextField(
                    label: "Email Address",
                    onTextChanged: (value) {

                    },
                    prefixIcon: Icon(Icons.email, color: AppColor.primaryColor),
                    isPasswordField: false,
                  ),
                  const SizedBox(height: 25.0),
                  PrimaryTextField(
                    label: "Password",
                    onTextChanged: (value) {

                    },
                    prefixIcon: Icon(Icons.lock, color: AppColor.primaryColor,),
                    isPasswordField: true,
                  ),
                  const SizedBox(height: 25.0),
                  PrimaryButton(label: 'Login', onButtonClick: () {

                  }),
                  const SizedBox(height: 25.0),
                  Text(
                    'OR',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: AppFonts.sfuitextmedium,
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  PrimaryOutlinedButton(label: 'Sign-Up', onButtonClick: () {

                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
