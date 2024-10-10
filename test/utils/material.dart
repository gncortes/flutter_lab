import 'package:flutter/material.dart';
import 'package:flutter_labs/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Função utilitária para criar um [MaterialApp] configurado para testes.
Widget createTestableWidget(Widget child) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('en'),
      Locale('pt'),
    ],
    home: Scaffold(body: child),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  );
}
