import 'package:flutter/material.dart';
import 'package:magd_soft_task/core/utils/app_colors.dart';
import 'package:magd_soft_task/core/utils/values_managers.dart';

ThemeData darkTheme() {
  return ThemeData(
    //! Main Color
    primaryColor: AppColors.primary,
    // hintColor: AppColors.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    //!Appbar THeme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    //!ElevatedButton Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        primary: AppColors.primary,
      ),
    ),
    //! TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.lightGrey,
        padding: const EdgeInsets.all(0),
        alignment: AlignmentDirectional.center,
      ),
    ),

    //!OutlinedButton Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: Colors.white,
        backgroundColor: Colors.white24,
      ),
    ),
    //! Text Theme
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        letterSpacing: 2,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        letterSpacing: 2,
        fontSize: 15,
        height: 1.5,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        letterSpacing: 2,
        fontSize: 12,
        height: 1.5,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
      ),
    ),

    //! InputDecoration Theme
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColors.lightGrey,
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: TextStyle(color: AppColors.grey),
      labelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: AppSize.s14,
      ),
      errorStyle: const TextStyle(color: AppColors.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.error,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
    ),
    //!Bottom Nav Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.green,
      selectedItemColor: Colors.red,
    ),
    //! Chip Theme
    chipTheme: const ChipThemeData(),
    //!Floating Action Button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );
}
