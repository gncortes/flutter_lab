import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

extension LocalizationExt on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}
