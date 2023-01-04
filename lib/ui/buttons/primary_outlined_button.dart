import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';

class PrimaryOutlinedButton extends StatefulWidget {

  final Function() onButtonClick;
  final String label;

  const PrimaryOutlinedButton({Key? key, required this.label, required this.onButtonClick}) : super(key: key);

  @override
  State<PrimaryOutlinedButton> createState() => _PrimaryOutlinedButtonState();
}

class _PrimaryOutlinedButtonState extends State<PrimaryOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          fixedSize: Size(MediaQuery.of(context).size.width, 55.0),
          elevation: 0,
          padding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: BorderSide(width: 1.0, color: AppColor.primaryColor)
      ),
      onPressed: () async {

        FocusScope.of(context).requestFocus(FocusNode());

        widget.onButtonClick();

      },
      child: Text(
        widget.label,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontFamily: AppFonts.sfuitextmedium,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
