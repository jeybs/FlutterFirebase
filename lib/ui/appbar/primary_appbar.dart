import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_color.dart';

class PrimaryAppbar {

  static AppBar getDefaultAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      elevation: 0.0,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.router.pop();
        },
        icon: const Icon(
          Icons.arrow_back_sharp,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }

}