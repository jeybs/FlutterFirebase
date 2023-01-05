import 'package:flutter/material.dart';

class NumberTextfield extends StatefulWidget {

  final Function(String)? onTextChanged;
  final String label;
  final Widget? prefixIcon;

  const NumberTextfield({Key? key, required this.label, required this.onTextChanged, this.prefixIcon}) : super(key: key);

  @override
  State<NumberTextfield> createState() => _NumberTextfieldState();
}

class _NumberTextfieldState extends State<NumberTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontFamily: 'sfuitextmedium'
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            fillColor: Colors.white,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            hintText: widget.label,
            labelText: widget.label,
            labelStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[400]
            ),
            hintStyle: TextStyle(fontSize: 16, color: Colors.grey[500]),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          onChanged: (value) {
            widget.onTextChanged!(value);
          },
        )
      ],
    );
  }
}
