import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/config/routes.gr.dart';
import 'package:flutter_firebase/pages/splash/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  SplashCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: BlocProvider(
          create: (context) => SplashCubit(),
          child: BlocConsumer<SplashCubit, SplashState>(
            listener: (context, state) {
              if(state is IsUserLoggedIn) {
                if(state.isLoggedIn) {
                  context.router.pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
                } else {
                  // Go Login
                  context.router.pushAndPopUntil(LoginRoute(), predicate: (_) => false);
                }
              }
            },
            builder: (context, state) {
              if(cubit == null) {
                cubit = context.read<SplashCubit>();
                cubit?.checkIfLoggedIn();
              }

              return mainBody();
            },
          ),
        ),
      ),
    );
  }

  Widget mainBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
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
          const SizedBox(height: 20.0,),
          const Text(
            "Let's Chat",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
