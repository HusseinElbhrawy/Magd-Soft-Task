import 'package:flutter/material.dart';
import 'package:magd_soft_task/config/locale/app_localizations.dart';

extension TranslationExtension on String {
  String? tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}
