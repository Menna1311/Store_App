import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomtextField extends StatelessWidget {
  CustomtextField(
      {super.key,
      required this.hint,
      required this.onChange,
      this.keyboardType});
  String hint;
  TextInputType? keyboardType;
  Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // ignore: body_might_complete_normally_nullable

      keyboardType: keyboardType,
      onChanged: onChange,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        label: Text(
          hint,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
