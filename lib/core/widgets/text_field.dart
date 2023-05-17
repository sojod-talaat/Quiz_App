import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String label;
  String? hint;
  Icon? prefixicon;
  TextEditingController? controller;

  CustomTextField(
      {super.key,
      required this.label,
      this.hint,
      this.prefixicon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        minLines: 1,
        maxLines: 3,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            label: Text(
              label,
              style: TextStyle(color: AppColors.grey),
            ),
            prefixIcon: prefixicon,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.tealColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.grey))),
      ),
    );
  }
}
