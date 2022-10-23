import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/values_managers.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.grey,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    //!Appbar
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
    ),
    //!TextTheme
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        letterSpacing: 2,
        fontSize: 18,
        height: 1.5,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        height: 1.5,
      ),
    ),

    //! TFF Theme
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColors.grey,
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: TextStyle(color: AppColors.grey),
      labelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: AppSize.s14,
      ),
      errorStyle: const TextStyle(color: AppColors.error),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.white,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey.withOpacity(.5),
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
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey.withOpacity(.5),
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

    //! TextButton THeme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.primary,
      ),
    ),
    //! Bottom Sheet Theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.white,
    ),

    //!ElevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
  );
}
