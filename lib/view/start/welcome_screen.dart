// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_with_firestore/view/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = 'welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          tooltip: AppLocalizations.of(context)!.getStarted,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          },
          child: Icon(
            Icons.arrow_right_alt_sharp,
          )),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: SvgPicture.asset('assets/svg/welcome.svg'),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                AppLocalizations.of(context)!.managetask,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.managetaskdesc,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
