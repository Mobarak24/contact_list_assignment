import 'package:contact_list/ui/screen/contact_list_screen.dart';
import 'package:contact_list/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      home: const ContactListScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppColors.themeColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.white,
          )
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14,),
            backgroundColor: AppColors.themeColor,
            foregroundColor: AppColors.white,
            fixedSize: const Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
