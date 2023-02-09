// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/my_theme.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'setting';

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String dropdownvalue = 'light';
  String dropdownvalueLanguage = 'english';

  // List of items in our dropdown menu
  var items = [
    'light',
    'dark',
  ];
  var itemsLanguage = [
    'english',
    'arabic',
  ];

  @override
  Widget build(BuildContext context) {
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
                'mode',
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
                    color: MyThemeData.lightTheme.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    underline: SizedBox(),
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                'language',
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
                    color: MyThemeData.lightTheme.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    underline: SizedBox(),
                    value: dropdownvalueLanguage,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: itemsLanguage.map((String itemsLanguage) {
                      return DropdownMenuItem(
                        value: itemsLanguage,
                        child: Text(itemsLanguage),
                      );
                    }).toList(),
                    onChanged: (String? newValueLanguage) {
                      setState(() {
                        dropdownvalueLanguage = newValueLanguage!;
                      });
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
