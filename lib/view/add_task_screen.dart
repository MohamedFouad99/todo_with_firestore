// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_with_firestore/utils/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/firebase_utils.dart';
import '../../model/task.dart';
import '../../utils/ui_utils.dart';

class AddTaskScreen extends StatefulWidget {
  static const String routeName = 'addTask';
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  String title = '';
  String description = '';
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.addtasktitle,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.width * .45,
              child: SvgPicture.asset('assets/svg/add.svg'),
            ),
            Form(
                key: formController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          filled: true,
                          labelText: AppLocalizations.of(context)!.title,
                          labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onChanged: (text) {
                          title = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!
                                .pleaseentertitle;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        minLines: 4,
                        maxLines: 4,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          filled: true,
                          labelText: AppLocalizations.of(context)!.desc,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onChanged: (text) {
                          description = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!
                                .pleaseentertaskdescription;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () {
                          chooseDate();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .1,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.date,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontSize: 16,
                                              color: MyThemeData.lightPrimary,
                                              fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          chooseDate();
                                        },
                                        icon: Icon(
                                          Icons.date_range,
                                          color: MyThemeData.lightPrimary,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                )),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              side: BorderSide(
                                width: 2,
                                color: MyThemeData
                                    .lightTheme.colorScheme.onPrimary,
                              )))),
                  onPressed: () {
                    addTask();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.addtaskbtn,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void chooseDate() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formController.currentState?.validate() == true) {
      Task task = Task(
          title: title,
          description: description,
          date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
      showLoading(context, AppLocalizations.of(context)!.loading,
          isCancelable: false);
      addTaskToFireStore(task).then((value) {
        hideDialoge(context);
        showAwsomeDialogSuccess(
            context, AppLocalizations.of(context)!.taskwasaddedsuccessfully,
            title: AppLocalizations.of(context)!.done, isCanclelable: false);
      }).catchError((onError) {
        hideDialoge(context);
        showAwsomeDialogSuccess(context,
            AppLocalizations.of(context)!.somethingwentwrongtryagainlater,
            title: AppLocalizations.of(context)!.sorry, isCanclelable: false);
      });
    }
  }
}
