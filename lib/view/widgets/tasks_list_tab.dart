// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, must_be_immutable, use_key_in_widget_constructors, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../model/task.dart';
import '../../providers/language_provider.dart';
import '../../utils/firebase_utils.dart';
import 'task_widget.dart';
import 'package:calender_picker/calender_picker.dart';

class TasksListTab extends StatefulWidget {
  @override
  State<TasksListTab> createState() => _TasksListTabState();
}

class _TasksListTabState extends State<TasksListTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var providerLanguage = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.todaytasks,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            CalenderPicker(
              dateTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.secondary),
              dayTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.secondary),
              locale: (providerLanguage.currentLanguage),
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Theme.of(context).colorScheme.onPrimary,
              selectedTextColor: Theme.of(context).primaryColor,
              onDateChange: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot<Task>>(
              stream: listenForTask(selectedDate),
              builder: (buildContext, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // loading
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text(AppLocalizations.of(context)!
                      .somethingwentwrongtryagainlater);
                }
                // we got data// show data
                List<Task> tasksList = snapshot.data?.docs
                        .map((docSnap) => docSnap.data())
                        .toList() ??
                    [];
                return ListView.builder(
                  itemBuilder: (_, index) {
                    return TaskWidget(tasksList[index]);
                  },
                  itemCount: tasksList.length,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
