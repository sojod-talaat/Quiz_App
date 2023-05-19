import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/utils/app_router.dart';
import 'package:quiz_app/core/utils/colors.dart';
import 'package:quiz_app/core/utils/quiz_model.dart';
import 'package:quiz_app/core/utils/styles.dart';
import 'package:quiz_app/core/widgets/appbar.dart';
import 'package:quiz_app/core/widgets/button.dart';
import 'package:quiz_app/core/widgets/text_field.dart';
import 'package:quiz_app/moduels/provider/quiz_provider.dart';

import 'options_widget.dart';

class AddQuestionPage extends StatefulWidget {
  const AddQuestionPage({super.key});

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<QuizProvider>(
        builder: (context, value, child) => Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                title: 'Add new question',
              )),
          body: SingleChildScrollView(
            child: Form(
              key: value.formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      vaildetor: (p0) {
                        if (p0!.isEmpty) {
                          return 'Question Field is required';
                        }
                        return null;
                      },
                      focusNode: value.focusNode,
                      controller: value.quizquestion,
                      label: 'Question',
                      hint: 'Enter the question',
                      prefixicon: Icon(
                        Icons.question_mark,
                        color: value.isFocused ? Colors.teal : Colors.grey,
                      ),
                    ),
                    OptionsWidget(
                      textEditingController: value.quizoptionA,
                      backgroundcolor: Colors.amber,
                      texteieldtitle: 'First Answer',
                      optiontitle: 'A',
                    ),
                    OptionsWidget(
                      textEditingController: value.quizoptionB,
                      backgroundcolor: Colors.green,
                      texteieldtitle: 'Second Answer',
                      optiontitle: 'B',
                    ),
                    OptionsWidget(
                      textEditingController: value.quizoptionC,
                      backgroundcolor: Colors.purple,
                      texteieldtitle: 'Third Answer',
                      optiontitle: 'C',
                    ),
                    OptionsWidget(
                      textEditingController: value.quizoptionD,
                      backgroundcolor: Colors.pink,
                      texteieldtitle: 'Fourth Answer',
                      optiontitle: 'D',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Text(
                        'Select the correct Answer',
                        style: Styles.text16black.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 100,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: Container(
                            height: 1.5,
                            color: AppColors.grColor,
                          ),
                          value:
                              Provider.of<QuizProvider>(context, listen: false)
                                  .dropdownvalue2,
                          onChanged: (String? newValue) {
                            setState(
                              () {
                                Provider.of<QuizProvider>(context,
                                        listen: false)
                                    .dropdownvalue2 = newValue!;
                              },
                            );
                          },
                          items: [
                            DropdownMenuItem<String>(
                              value: 'A',
                              child: Center(
                                  child: Text(
                                'A',
                                style: Styles.text18teal
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                            ),
                            DropdownMenuItem<String>(
                              value: 'B',
                              child: Center(
                                  child: Text(
                                'B',
                                style: Styles.text18teal
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                            ),
                            DropdownMenuItem<String>(
                              value: 'C',
                              child: Center(
                                  child: Text(
                                'C',
                                style: Styles.text18teal
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                            ),
                            DropdownMenuItem<String>(
                              value: 'D',
                              child: Center(
                                  child: Text(
                                'D',
                                style: Styles.text18teal
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                        width: double.infinity,
                        height: 45,
                        borderRadius: 8,
                        text: 'Add question',
                        isCenter: true,
                        function: () async {
                          if (value.formkey.currentState!.validate()) {
                            await value.inserttoquiz(QuizModel(
                              question: value.quizquestion.text,
                              options: [
                                (value.quizoptionA.text),
                                (value.quizoptionB.text),
                                (value.quizoptionC.text),
                                (value.quizoptionD.text),
                              ],
                              answer: Provider.of<QuizProvider>(context,
                                      listen: false)
                                  .dropdownvalue2,
                            ));
                            value.cleartextfeilds();

                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(
                                context, AppRouter.quizquestion);
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
