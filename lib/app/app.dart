import 'package:flutter/material.dart';

import '../config/locale/app_localizations_setup.dart';
import '../config/routes/app_routes.dart';
import '../config/themes/dark_theme.dart';
import '../config/themes/light_theme.dart';
import '../core/utils/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.light,
      title: AppStrings.appName,
      //  locale: state.selectedLocale,
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      onGenerateRoute: AppRoutes.onGenerateRoute,

      // home: const HomeScreen(),
    );
  }
}
