import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeTitle => 'Home';

  @override
  String get homeFittedBoxExamplesTitle => 'FittedBox Examples';

  @override
  String get homeFittedBoxExamplesSubtitle => 'Learn how to use the FittedBox';

  @override
  String get fittedBoxExamplesTitle => 'FittedBox Examples';

  @override
  String get fittedBoxExamplesDescription => 'The `FittedBox` widget is used to resize its child according to the available dimensions, maintaining the aspect ratio of the content. By default, it uses `BoxFit.contain`, which means the content is resized to fit within the available space without losing proportion. However, other options like `BoxFit.cover` can be configured as needed. The `FittedBox` is especially useful for ensuring that images, texts, or other widgets adapt well to different screen sizes, avoiding being clipped or stretched disproportionately.';

  @override
  String get fittedBoxExamplesMoreInfo => 'For more information, check the official Flutter documentation on FittedBox:';
}
