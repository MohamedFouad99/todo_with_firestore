// ignore_for_file: prefer_const_constructors, avoid_init_to_null, unused_local_variable

import 'package:flutter/material.dart';
import 'package:todo_with_firestore/utils/firebase_utils.dart';
import 'my_theme.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

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

void showAwsomeDialogFailure(BuildContext context, String content,
    {String title = '', bool isCanclelable = true}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    borderSide: const BorderSide(
      color: Colors.red,
      width: 1,
    ),
    width: MediaQuery.of(context).size.width * .95,
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(14),
    ),
    dismissOnTouchOutside: isCanclelable,
    dismissOnBackKeyPress: isCanclelable,
    // onDismissCallback: (type) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Dismissed by $type'),
    //     ),
    //   );
    // },
    headerAnimationLoop: true,
    animType: AnimType.scale,
    title: title,
    desc: content,
    showCloseIcon: false,
    // btnCancelOnPress: () {},
    btnOkOnPress: () {
      Navigator.pop(context);
    },
  ).show();
}

void showAwsomeDialogSuccess(BuildContext context, String content,
    {String title = '', bool isCanclelable = true}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    borderSide: const BorderSide(
      color: Colors.green,
      width: 1,
    ),
    width: MediaQuery.of(context).size.width * .95,
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(14),
    ),
    dismissOnTouchOutside: isCanclelable,
    dismissOnBackKeyPress: isCanclelable,
    // onDismissCallback: (type) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Dismissed by $type'),
    //     ),
    //   );
    // },
    headerAnimationLoop: true,
    animType: AnimType.scale,
    title: title,
    desc: content,
    showCloseIcon: false,
    // btnCancelOnPress: () {},
    btnOkOnPress: () {
      Navigator.pop(context);
    },
  ).show();
}
