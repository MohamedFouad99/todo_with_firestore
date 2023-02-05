import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'utils/my_theme.dart';
import 'view/home/home_screen.dart';
import 'view/screens/add_task_screen.dart';
import 'view/screens/edit_screen.dart';
import 'view/setting/settings_tab.dart';
import 'view/start/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SettingsTab.routeName: (context) => SettingsTab(),
        AddTaskScreen.routeName: (context) => AddTaskScreen(),
        EditScreen.routeName: (context) => EditScreen(),
      },
      initialRoute: WelcomeScreen.routeName,
      theme: MyThemeData.lightTheme,
    );
  }
}
