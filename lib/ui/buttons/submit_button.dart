import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';

class SubmitButton extends StatefulWidget {

  final Function() onButtonClick;
  final String label;

  const SubmitButton({Key? key, required this.label, required this.onButtonClick}) : super(key: key);

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            fixedSize: Size(MediaQuery.of(context).size.width, 55.0),
            elevation: 0,
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            side: const BorderSide(width: 1.0, color: Colors.white)
        ),
        onPressed: () async {

          FocusScope.of(context).requestFocus(new FocusNode());

          widget.onButtonClick();

        },
        child: Text(
          widget.label,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontFamily: AppFonts.sfuitextregular,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
