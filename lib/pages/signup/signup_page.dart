import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';
import 'package:flutter_firebase/ui/appbar/primary_appbar.dart';
import 'package:flutter_firebase/ui/appbar/submit_button.dart';
import 'package:flutter_firebase/ui/buttons/primary_button.dart';
import 'package:flutter_firebase/ui/textfields/number_textfield.dart';
import 'package:flutter_firebase/ui/textfields/primary_textfield.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool termAgreement = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar.getDefaultAppBar(context, ""),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Text(
                  'Sign-Up',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontFamily: AppFonts.sfuitextmedium
                  ),
                ),
                const SizedBox(height: 15.0),
                RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontFamily: AppFonts.sfuitextregular,
                      ),
                      children:[
                        TextSpan(
                            text: 'Login',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: AppFonts.sfuitextmedium,
                                fontWeight: FontWeight.bold
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              context.router.pop();
                            }
                        ),
                      ]
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'Fill up all required fields *',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30.0),
                PrimaryTextField(
                  label: 'Name *',
                  onTextChanged: (value) {

                  },
                  isPasswordField: false,
                  prefixIcon: Icon(Icons.person, color: AppColor.primaryColor,),
                ),
                const SizedBox(height: 15.0,),
                PrimaryTextField(
                  label: 'Email *',
                  onTextChanged: (value) {

                  },
                  isPasswordField: false,
                  prefixIcon: Icon(Icons.email, color: AppColor.primaryColor,),
                ),
                const SizedBox(height: 15.0,),
                NumberTextfield(
                  label: 'Mobile Number *',
                  onTextChanged: (value) {

                  },
                  prefixIcon: Icon(Icons.phone_android, color: AppColor.primaryColor,),
                ),
                const SizedBox(height: 15.0,),
                PrimaryTextField(
                  label: 'Password *',
                  onTextChanged: (value) {

                  },
                  isPasswordField: true,
                  prefixIcon: Icon(Icons.lock, color: AppColor.primaryColor,),
                ),
                const SizedBox(height: 15.0,),
                PrimaryTextField(
                  label: 'Confirm Password *',
                  onTextChanged: (value) {

                  },
                  isPasswordField: true,
                  prefixIcon: Icon(Icons.lock, color: AppColor.primaryColor,),
                ),
                const SizedBox(height: 15.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Checkbox(
                          checkColor: Colors.white,
                          activeColor: AppColor.primaryColor,
                          value: termAgreement,
                          onChanged: (bool? value) {
                            setState(() {
                              termAgreement = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              text: 'I agree with the ',
                              style: const TextStyle(
                                  color: Colors.black
                              ),
                              children: [
                                TextSpan(
                                    text: 'Terms and Conditions ',
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppFonts.sfuitextregular,
                                      fontSize: 14.0,
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      // Navigator.pushNamed(context, '/browser', arguments: {
                                      //   'url': TERMS_LINK
                                      // });
                                    }
                                ),
                                TextSpan(
                                    text: 'and ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: AppFonts.sfuitextregular
                                    )
                                ),
                                TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      fontFamily: AppFonts.sfuitextregular
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      // Navigator.pushNamed(context, '/browser', arguments: {
                                      //   'url': PRIVACY_LINK
                                      // });
                                    }
                                ),
                              ]
                          )
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0,),
                SubmitButton(label: 'Submit', onButtonClick: () {

                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

