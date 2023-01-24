import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:todo_with_firestore/view/my_theme.dart';
import 'package:todo_with_firestore/view/setting/settings_tab.dart';
import 'package:todo_with_firestore/view/start/welcome_screen.dart';
import 'firebase_options.dart';
import 'view/home/home_screen.dart';

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
      },
      initialRoute: WelcomeScreen.routeName,
      theme: MyThemeData.lightTheme,
    );
  }
}
