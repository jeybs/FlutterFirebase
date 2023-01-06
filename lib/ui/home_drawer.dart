import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';
import 'package:flutter_firebase/models/user_data.dart';
import 'package:flutter_firebase/pages/home/home_cubit.dart';

class HomeDrawer {

  static Widget drawer(UserData? userData, HomeCubit? cubit) {
    return Drawer(
      backgroundColor: AppColor.primaryColor,
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: Column(
            children: [
              const CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
                radius: 60,
                backgroundColor: Colors.grey,
              ),
              const SizedBox(height: 15.0),
              Text(
                userData != null ? userData.name : "-",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: AppFonts.sfuitextregular
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontFamily: AppFonts.sfuitextregular
                ),
              ),
              Divider(
                color: Colors.white,
                height: 50.0,
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white,),
                onTap: () {
                  cubit?.logout();
                },
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: AppFonts.sfuitextmedium
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}