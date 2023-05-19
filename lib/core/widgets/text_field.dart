import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/utils/colors.dart';
import 'package:quiz_app/moduels/provider/quiz_provider.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String label;
  String? hint;
  Icon? prefixicon;
  TextEditingController? controller;
  FocusNode? focusNode;
  String? Function(String?)? vaildetor;

  CustomTextField(
      {super.key,
      required this.label,
      this.hint,
      this.prefixicon,
      this.focusNode,
      required this.vaildetor,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: vaildetor,
        focusNode: focusNode,
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
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.tealColor, width: 2.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.tealColor, width: 2.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.grey))),
      ),
    );
  }
}
