import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends StatelessWidget {

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: AppColor.primaryColor,
      size: 50.0,
    );
  }
}
