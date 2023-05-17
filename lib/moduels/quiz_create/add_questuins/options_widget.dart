import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/styles.dart';
import 'package:quiz_app/core/widgets/text_field.dart';

class OptionsWidget extends StatelessWidget {
  String optiontitle;
  String texteieldtitle;
  Color backgroundcolor;
  TextEditingController textEditingController;
  OptionsWidget(
      {Key? key,
      required this.optiontitle,
      required this.texteieldtitle,
      required this.backgroundcolor,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: backgroundcolor,
          radius: 25,
          child: Text(
            optiontitle,
            style: Styles.text18
                .copyWith(fontSize: 30, fontWeight: FontWeight.normal),
          ),
        ),
        Expanded(
          child: CustomTextField(
            controller: textEditingController,
            label: texteieldtitle,
          ),
        )
      ],
    );
  }
}
