import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';

class PrimaryButton extends StatefulWidget {

  final Function() onButtonClick;
  final String label;

  const PrimaryButton({Key? key, required this.label, required this.onButtonClick}) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      buttonColor: Colors.white,
      minWidth: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
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
            color: Colors.black,
            fontSize: 16.0,
            fontFamily: AppFonts.sfuitextmedium,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
