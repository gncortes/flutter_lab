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
        await tester.binding.setSurfaceSize(device.size);
        await tester.pumpWidgetBuilder(
          createTestableWidget(ValueRangeCard(key: UniqueKey())),
          surfaceSize: device.size,
        );
        await tester.pumpAndSettle();

        final deviceNamePath =
            '${device.name}_${device.size.width.toInt()}x${device.size.height.toInt()}';

        await screenMatchesGolden(
          tester,
          '$deviceNamePath/1initial_state',
        );

        final sliderFinder = find.byType(RangeSlider);
        final sliderWidth = tester.getSize(sliderFinder).width;
        final sliderRect = tester.getRect(sliderFinder);

        await tester.tapAt(Offset(
            sliderRect.left + sliderRect.width / 2, sliderRect.center.dy));
        await tester.pumpAndSettle();

        await screenMatchesGolden(
          tester,
          '$deviceNamePath/2mid_state',
        );

        await tester.drag(
          sliderFinder,
          Offset(sliderWidth / 2, 0),
        );
        await tester.pumpAndSettle();

        await screenMatchesGolden(
          tester,
          '$deviceNamePath/3final_state',
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
