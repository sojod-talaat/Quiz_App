import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/utils/app_router.dart';
import 'package:quiz_app/core/utils/assets_constant.dart';
import 'package:quiz_app/core/utils/colors.dart';
import 'package:quiz_app/core/utils/styles.dart';
import 'package:quiz_app/core/widgets/button.dart';
import 'package:quiz_app/moduels/provider/quiz_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.tealColor,
        title: Text(
          'Quiz app',
          style: Styles.text18.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Sojod Talaat'),
            accountEmail: Text('Sojod@gmail.com'),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text(
                  'S',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                )),
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.addnewquestion);
            },
            leading: const Icon(Icons.edit),
            title: const Text('Create Quiz'),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.startquiz);
            },
            leading: const Icon(Icons.quiz),
            title: const Text('Start Quiz'),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              exit(0);
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
          ),
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.homeimage,
              width: 260,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              isCenter: true,
              borderRadius: 10,
              width: 185,
              height: 44,
              text: 'Let\'s Strat!',
              function: () {
                log(Provider.of<QuizProvider>(context, listen: false)
                    .quizQuestion
                    .length
                    .toString());

                if (Provider.of<QuizProvider>(context, listen: false)
                        .quizQuestion
                        .length <=
                    4) {
                  Navigator.pushNamed(context, AppRouter.invaildnumberofq);
                } else {
                  Navigator.pushNamed(context, AppRouter.startquiz);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
