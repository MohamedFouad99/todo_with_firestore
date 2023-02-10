// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_firestore/providers/language_provider.dart';

import '../../providers/theme_provider.dart';
import '../../utils/my_theme.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'setting';

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  //todo if language change changed
  String? dropdownvalue;
  String? dropdownvalueLanguage;

  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    var items = [
      AppLocalizations.of(context)!.light,
      AppLocalizations.of(context)!.dark,
    ];
    var itemsLanguage = [
      AppLocalizations.of(context)!.english,
      AppLocalizations.of(context)!.arabic,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.setting,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.mode,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    underline: SizedBox(),
                    value: languageProvider.currentLanguage == 'en' &&
                            themeProvider.themeMode == ThemeMode.light
                        ? 'light'
                        : languageProvider.currentLanguage == 'en' &&
                                themeProvider.themeMode == ThemeMode.dark
                            ? 'dark'
                            : languageProvider.currentLanguage == 'ar' &&
                                    themeProvider.themeMode == ThemeMode.light
                                ? 'نهاري'
                                : 'داكن',
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      dropdownvalue = newValue!;
                      if (newValue == AppLocalizations.of(context)!.light) {
                        themeProvider.changeTheme(ThemeMode.light);
                      } else {
                        themeProvider.changeTheme(ThemeMode.dark);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    underline: SizedBox(),
                    value: languageProvider.currentLanguage == 'en'
                        ? 'english'
                        : 'العربية',
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: itemsLanguage.map((String itemsLanguage) {
                      return DropdownMenuItem(
                        value: itemsLanguage,
                        child: Text(itemsLanguage),
                      );
                    }).toList(),
                    onChanged: (String? newValueLanguage) {
                      dropdownvalueLanguage = newValueLanguage!;
                      if (newValueLanguage == 'arabic') {
                        languageProvider.changeLanguage('ar');
                      } else {
                        languageProvider.changeLanguage('en');
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
