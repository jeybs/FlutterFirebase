import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/ui/buttons/primary_button.dart';
import 'package:flutter_firebase/ui/buttons/primary_outlined_button.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog({Key? key}) : super(key: key);

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {

  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter email address',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600]
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  searchValue = value;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColor.textFieldBorder
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.textFieldBorder,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  hintText: '',
                  labelText: '',
                  labelStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[400]
                  ),
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey[500]),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.textFieldBorder,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              PrimaryOutlinedButton(
                label: 'Search',
                onButtonClick: () {
                  Navigator.pop(context, {
                    "email": searchValue
                  });
                },
              ),
              const SizedBox(height: 10.0),
              PrimaryButton(
                label: 'Cancel',
                onButtonClick: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
