import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {

  final Function(String)? onTextChanged;
  final String label;
  final Widget? prefixIcon;
  final bool isPasswordField;
  final bool isMultiLine;

  const DefaultTextField({Key? key, required this.label, required this.onTextChanged, this.prefixIcon, required this.isPasswordField, this.isMultiLine = false}) : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPasswordField,
      keyboardType: widget.isMultiLine ? TextInputType.text : TextInputType.multiline,
      maxLines: widget.isMultiLine ? null : 1,
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
    );
  }
}
