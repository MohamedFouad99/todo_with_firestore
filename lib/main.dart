// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_with_firestore/providers/language_provider.dart';
import 'package:todo_with_firestore/providers/theme_provider.dart';
import 'firebase_options.dart';
import 'utils/my_theme.dart';
import 'view/add_task_screen.dart';
import 'view/edit_screen.dart';
import 'view/home_screen.dart';
import 'view/settings_screen.dart';
import 'view/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //make data offline
  FirebaseFirestore.instance.disableNetwork();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LanguageProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  late LanguageProvider providerLanguage;
  late ThemeProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ThemeProvider>(context);
    providerLanguage = Provider.of<LanguageProvider>(context);
    sharedPref;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //locale: Locale(providerLanguage.currentLanguage),
      locale: Locale(providerLanguage.currentLanguage),
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SettingsTab.routeName: (context) => SettingsTab(),
        AddTaskScreen.routeName: (context) => AddTaskScreen(),
        EditScreen.routeName: (context) => EditScreen(),
      },
      initialRoute: WelcomeScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
    );
  }

  void sharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    providerLanguage.changeLanguage(prefs.getString('language') ?? 'en');
    if (prefs.getString('theme') == 'light') {
      provider.changeTheme(ThemeMode.light);
    } else if (prefs.getString('theme') == 'dark') {
      provider.changeTheme(ThemeMode.dark);
    } else {
      provider.changeTheme(ThemeMode.dark);
    }
  }
}
