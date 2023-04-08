import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';
import 'package:flutter_firebase/data/firebase/firebase_services.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:flutter_firebase/pages/home/home_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


class HomeDrawer {

  static Widget drawer(BuildContext context, UserData? userData, HomeCubit? cubit, Function(XFile?) onImageSelected) {
    return Drawer(
      backgroundColor: AppColor.primaryColor,
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery, maxWidth: 300, maxHeight: 300, imageQuality: 70);
                  onImageSelected(image);
                },
                child: userPhoto(context, userData?.photo != null ? userData!.photo : ""),
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
                leading: const Icon(Icons.contact_mail, color: Colors.white,),
                onTap: () {

                },
                title: Text(
                  'Contact List',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: AppFonts.sfuitextmedium
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white,),
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


  static Widget userPhoto(BuildContext context, String? path) {
    if(path!.isNotEmpty) {
      return Container(
        height: 100.0,
        width: 100.0,
        child: ExtendedImage.network(
          path,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
          cache: true,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(60.0)),
        ),
      );
    } else {
      return CircleAvatar(
        child: Icon(
          Icons.person,
          size: 60,
          color: Colors.white,
        ),
        radius: 60,
        backgroundColor: Colors.grey,
      );
    }
  }
}