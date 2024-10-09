import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get homeTitle => 'Tela Inicial';

  @override
  String get homeFittedBoxExamplesTitle => 'Exemplos de FittedBox';

  @override
  String get homeFittedBoxExamplesSubtitle => 'Veja como usar o FittedBox';

  @override
  String get fittedBoxExamplesTitle => 'Exemplos de FittedBox';

  @override
  String get fittedBoxExamplesDescription => 'O widget `FittedBox` é usado para redimensionar seu filho de acordo com as dimensões disponíveis, mantendo a proporção do conteúdo. Por padrão, ele utiliza `BoxFit.contain`, o que faz com que o conteúdo seja redimensionado para caber dentro do espaço disponível sem perder a proporção. No entanto, também existem outras opções de ajuste, como `BoxFit.cover`, que podem ser configuradas conforme a necessidade. O `FittedBox` é especialmente útil para garantir que imagens, textos ou outros widgets se adaptem bem a diferentes tamanhos de tela, evitando que sejam cortados ou esticados de forma desproporcional.';

  @override
  String get fittedBoxExamplesMoreInfo => 'Para mais informações, confira a documentação oficial do Flutter sobre o FittedBox:';
}
