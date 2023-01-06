import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/config/routes.gr.dart';
import 'package:flutter_firebase/models/user_data.dart';
import 'package:flutter_firebase/pages/home/home_cubit.dart';
import 'package:flutter_firebase/ui/appbar/home_appbar.dart';
import 'package:flutter_firebase/ui/home_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeCubit? cubit;
  UserData? _userData = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar.getDefaultAppBar(context, ''),
      drawer: HomeDrawer.drawer(_userData, cubit),
      body: SafeArea(
        top: true,
        child: BlocProvider(
          create: (context) => HomeCubit(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if(state is UserProfileLoaded) {
                setState(() {
                  _userData = state.userData;
                });
              }

              if(state is UserLogout) {
                context.router.pushAndPopUntil(LoginRoute(), predicate: (_) => false);
              }
            },
            builder: (context, state) {
              if(cubit == null) {
                cubit = context.read<HomeCubit>();
                cubit?.loadProfile();
              }

              return Text('asd');
            },
          ),
        ),
      ),
    );
  }
}
