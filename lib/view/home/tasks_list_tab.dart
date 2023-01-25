// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, must_be_immutable, use_key_in_widget_constructors, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../model/task.dart';
import '../../firebase_utils.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "today tasks",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            CalenderPicker(
              dateTextStyle: TextStyle(color: Colors.grey),
              dayTextStyle: TextStyle(color: Colors.grey),
              locale: 'en',
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.white,
              selectedTextColor: Colors.blue,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            // CalendarTimeline(
            //   initialDate: selectedDate,
            //   firstDate: DateTime.now().subtract(Duration(days: 365)),
            //   lastDate: DateTime.now().add(Duration(days: 365)),
            //   onDateSelected: (date) {
            //     if (date == null) return;
            //     selectedDate = date;
            //     setState(() {});
            //   },
            //   leftMargin: 30,
            //   monthColor: Colors.black,
            //   dayColor: Colors.black,
            //   activeDayColor: Theme.of(context).primaryColor,
            //   activeBackgroundDayColor: Colors.white,
            //   dotsColor: Theme.of(context).primaryColor,
            //   selectableDayPredicate: (date) => true,
            //   locale: 'en',
            // ),
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
                  return Text('something went wrong');
                  // show try again button
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
