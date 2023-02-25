import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/firebase_utils.dart';
import '../../model/task.dart';
import '../../utils/my_theme.dart';
import '../../utils/ui_utils.dart';
import 'package:intl/intl.dart';

class EditScreen extends StatefulWidget {
  static const String routeName = 'edit';
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  DateTime? selectedDate;
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  late Task task;
  late DateTime date;
  @override
  Widget build(BuildContext context) {
    task = ModalRoute.of(context)!.settings.arguments as Task;
    int timestamp = task.date;
    date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.edittasktitle,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                height: MediaQuery.of(context).size.width * .45,
                child: SvgPicture.asset('assets/svg/edit.svg'),
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
                          initialValue: task.title,
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
                            task.title = text;
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
                          initialValue: task.description,
                          minLines: 4,
                          maxLines: 4,
                          decoration: InputDecoration(
                            fillColor: Theme.of(context).colorScheme.onPrimary,
                            filled: true,
                            labelText: AppLocalizations.of(context)!.desc,
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
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onChanged: (text) {
                            task.description = text;
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
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
                                        selectedDate == null
                                            ? formattedDate
                                            : '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                fontSize: 16,
                                                color: MyThemeData.lightPrimary,
                                                fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                      Icon(
                                        Icons.date_range,
                                        color: MyThemeData.lightPrimary,
                                      )
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    side: BorderSide(
                                      width: 2,
                                      color: MyThemeData
                                          .lightTheme.colorScheme.onPrimary,
                                    )))),
                    onPressed: () {
                      editTask();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.savechange,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                    )),
              )
            ]),
          ),
        ));
  }

  void chooseDate() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 3000)));

    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void editTask() {
    selectedDate ??= date;
    showLoading(context, AppLocalizations.of(context)!.loading,
        isCancelable: false);
    editTaskFromFireStore(task, selectedDate!).then((value) {
      hideDialoge(context);
      showAwsomeDialogSuccess(
          context, AppLocalizations.of(context)!.taskwaseditedsuccessfully,
          title: AppLocalizations.of(context)!.done, isCanclelable: false);
    }).catchError((onError) {
      hideDialoge(context);
      showAwsomeDialogSuccess(context,
          AppLocalizations.of(context)!.somethingwentwrongtryagainlater,
          title: AppLocalizations.of(context)!.sorry, isCanclelable: false);
    });
  }
}
