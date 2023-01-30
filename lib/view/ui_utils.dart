// ignore_for_file: prefer_const_constructors, avoid_init_to_null, unused_local_variable

import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'my_theme.dart';

void showLoading(BuildContext context, String message,
    {bool isCancelable = false}) {
  showDialog(
      barrierDismissible: isCancelable,
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          content: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message),
              ),
            ],
          ),
        );
      });
}

void hideDialoge(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(BuildContext context, String message, String postiveActionText,
    VoidCallback postiveAction,
    {String? negativeActionText = null,
    VoidCallback? negativeAction = null,
    bool isCanclelable = true}) {
  List<Widget> actions = [
    TextButton(
        onPressed: postiveAction,
        child: Text(
          postiveActionText,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 16,
              color: MyThemeData.lightPrimary,
              fontWeight: FontWeight.w600),
        )),
  ];
  if (negativeActionText != null) {
    actions.add(TextButton(
        onPressed: negativeAction,
        child: Text(
          negativeActionText,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 16,
              color: MyThemeData.lightPrimary,
              fontWeight: FontWeight.w600),
        )));
  }
  // AwesomeDialog(
  //   context: context,
  //autoDismiss: isCanclelable,
  //   dialogType: DialogType.success,
  //   animType: AnimType.topSlide,
  //   title: 'Done',
  //   desc: '$message',
  //   btnOkOnPress: () {
  //     actions;
  //   },
  // )..show();
  showDialog(
      barrierDismissible: isCanclelable,
      context: context,
      builder: (buildContext) {
        return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                    color: MyThemeData.lightPrimary,
                    fontWeight: FontWeight.w600),
              ),
            ),
            actions: actions);
      });
}
