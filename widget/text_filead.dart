import 'package:flutter/material.dart';

class TextFormFileadApps extends StatelessWidget {
  TextEditingController inPutData;
  TextInputType textInputType;
  String labelText;
  bool obscureText;
  IconData prefixIcon;
  IconData? suffixIcon;
  Function()? onTap;
  Function(String)? onChange;
  String? Function(String?)? validator;

  TextFormFileadApps(
      {super.key,
      required this.inPutData,
      required this.textInputType,
      required this.labelText,
      required this.prefixIcon,
      required this.validator,
      this.suffixIcon,
      this.obscureText = false,
      this.onTap,
      this.onChange

      // Function(String)? onFieldSubmitted,
      });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inPutData,
      obscureText: obscureText,
      keyboardType: textInputType,
      onTap: onTap,
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        // hintText: 'Email Address',
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: Icon(
          suffixIcon,
        ),
      ),
    );
  }
}
