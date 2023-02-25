// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/language_provider.dart';
import '../../utils/firebase_utils.dart';
import '../../model/task.dart';
import '../../utils/my_theme.dart';
import '../edit_screen.dart';

class TaskWidget extends StatefulWidget {
  Task task;
  TaskWidget(this.task);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    var providerLanguage = Provider.of<LanguageProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        extentRatio: .25,
        children: [
          SlidableAction(
            onPressed: (buildContext) {
              deleteTaskFromFireStore(widget.task);
            },
            borderRadius: providerLanguage.currentLanguage == 'en'
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(140),
                    topLeft: Radius.circular(140),
                    bottomRight: Radius.circular(18),
                    topRight: Radius.circular(18),
                  )
                : BorderRadius.only(
                    bottomRight: Radius.circular(140),
                    topRight: Radius.circular(140),
                    bottomLeft: Radius.circular(18),
                    topLeft: Radius.circular(18),
                  ),
            label: AppLocalizations.of(context)!.delete,
            backgroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete,
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          Navigator.pushNamed(context, EditScreen.routeName,
              arguments: widget.task);
        },
        child: Container(
          height: 90,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            elevation: 0,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: widget.task.isDone
                                ? MyThemeData.colorGreen
                                : Theme.of(context).primaryColor,
                            width: 6),
                        borderRadius: providerLanguage.currentLanguage == 'en'
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(14.0),
                                topLeft: Radius.circular(14.0))
                            : BorderRadius.only(
                                bottomRight: Radius.circular(14.0),
                                topRight: Radius.circular(14.0)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              widget.task.title,
                              style: widget.task.isDone
                                  ? Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                      )
                                  : Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          Text(
                            widget.task.description,
                            style: widget.task.isDone
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      color: MyThemeData.colorLightGreen,
                                    )
                                : Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        editIsDone(widget.task);
                        //  taskDone = true;
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: widget.task.isDone
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.secondary,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            child: widget.task.isDone
                                ? Text(
                                    AppLocalizations.of(context)!.done,
                                    style: TextStyle(
                                        color: MyThemeData.colorGreen,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                          ),
                          SizedBox(width: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
