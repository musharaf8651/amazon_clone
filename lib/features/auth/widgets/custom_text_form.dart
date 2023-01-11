import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String textEditinLabel;
  const CustomTextFormField(
      {super.key, required this.controller, required this.textEditinLabel});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: textEditinLabel,
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      validator: (val) {},
    );
  }
}
