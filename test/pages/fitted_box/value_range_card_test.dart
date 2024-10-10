import 'package:flutter/material.dart';
import 'package:flutter_labs/pages/fitted_box/value_range_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../utils/devices.dart';
import '../../utils/material.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await loadAppFonts();
  });
  group('ValueRangeCard', () {
    testGoldens('renders correctly on various devices', (tester) async {
      final devices = getTestDevices();

      for (var device in devices) {
        // Define o tamanho da tela para o dispositivo atual.
        await tester.binding.setSurfaceSize(device.size);

        // Garante que o widget esteja no estado inicial.
        await tester.pumpWidgetBuilder(
          createTestableWidget(ValueRangeCard(key: UniqueKey())),
          surfaceSize: device.size,
        );
        await tester.pumpAndSettle();

        // Captura o estado inicial do widget.
        await screenMatchesGolden(
          tester,
          'goldens/${device.name}_${device.size.width.toInt()}x${device.size.height.toInt()}/initial_state',
        );

        // Ajusta o slider para simular uma mudança no estado.
        final sliderFinder = find.byType(RangeSlider);
        await tester.drag(sliderFinder, const Offset(100, 0));
        await tester.pumpAndSettle();

        // Captura o estado final do widget após a interação.
        await screenMatchesGolden(
          tester,
          'goldens/${device.name}_${device.size.width.toInt()}x${device.size.height.toInt()}/final_state',
        );
      }
    });

    testWidgets('updates displayed value when slider is adjusted',
        (tester) async {
      await tester.pumpWidget(
        createTestableWidget(const ValueRangeCard()),
      );

      expect(find.textContaining('1.'), findsOneWidget);

      final sliderFinder = find.byType(RangeSlider);
      await tester.drag(sliderFinder, const Offset(100, 0));
      await tester.pumpAndSettle();
      final regex = RegExp(r'[\d,]+');
      final textFinder = find.byWidgetPredicate((widget) {
        if (widget is Text) {
          return regex.hasMatch(widget.data ?? '');
        }
        return false;
      });

      expect(textFinder, findsOneWidget);
    });
  });
}
