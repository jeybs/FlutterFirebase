import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/config/routes.gr.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';
import 'package:flutter_firebase/pages/login/login_cubit.dart';
import 'package:flutter_firebase/ui/buttons/primary_button.dart';
import 'package:flutter_firebase/ui/buttons/primary_outlined_button.dart';
import 'package:flutter_firebase/ui/loading_dialog.dart';
import 'package:flutter_firebase/ui/textfields/primary_textfield.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class LoginPage extends StatelessWidget {

  late ProgressDialog pd;
  LoginCubit? cubit;
  String email = "";
  String password = "";

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    pd = ProgressDialog(context, type: ProgressDialogType.normal ,isDismissible: false, showLogs: false);

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
                  Color(0x665ac18e),
                  Color(0xff5ac18e),
                  Color(0xff5ac18e),
                  Color(0xff5ac18e),
                ]
              )
            ),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                pd.hide();
                if(state is LoginSuccess) {
                  context.router.pushAndPopUntil(HomeRoute(), predicate: (_) => false);
                } else if(state is LoginFail) {

                  showOkAlertDialog(
                    context: context,
                    title: "Login Error",
                    message: state.message);
                } else if(state is AlreadyLoggedIn) {
                  if(state.isLoggedIn) {
                    context.router.pushAndPopUntil(HomeRoute(), predicate: (_) => false);
                  }
                }
              },
              builder: (context, state) {
                if(cubit == null) {
                  cubit = context.read<LoginCubit>();
                }

                return mainBody(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget mainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "icon",
              child: Image.asset(
                'assets/icon_splash_chat.png',
                width: 150.0,
              ),
            ),
            PrimaryTextField(
              label: "Email Address",
              onTextChanged: (value) {
                email = value;
              },
              prefixIcon: Icon(Icons.email, color: AppColor.primaryColor),
              isPasswordField: false,
            ),
            const SizedBox(height: 25.0),
            PrimaryTextField(
              label: "Password",
              onTextChanged: (value) {
                password = value;
              },
              prefixIcon: Icon(Icons.lock, color: AppColor.primaryColor,),
              isPasswordField: true,
            ),
            const SizedBox(height: 25.0),
            PrimaryButton(label: 'Login', onButtonClick: () {

              pd.style(
                  message: "Logging In...",
                  progressWidget: const LoadingDialog());

              pd.show();

              cubit?.login(email, password);
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
              context.router.push(const SignUpRoute());
            })
          ],
        ),
      ),
    );
  }
}
