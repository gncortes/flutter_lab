import 'dart:ui';
import 'package:golden_toolkit/golden_toolkit.dart';

List<Device> getTestDevices() {
  return [
    Device.phone,
    Device.iphone11,
    const Device(
      name: 'iPhone SE',
      size: Size(320, 568),
    ),
    const Device(
      name: 'iPhone 8',
      size: Size(375, 667),
    ),
    const Device(
      name: 'iPhone 12 Mini',
      size: Size(360, 780),
    ),
    const Device(
      name: 'iPhone 12',
      size: Size(390, 844),
    ),
    const Device(
      name: 'iPhone 12 Pro Max',
      size: Size(428, 926),
    ),
    const Device(
      name: 'Pixel 4a',
      size: Size(393, 851),
    ),
    const Device(
      name: 'iPad Air',
      size: Size(820, 1180),
    ),
    const Device(
      name: 'iPad Pro 11-inch',
      size: Size(834, 1194),
    ),
    const Device(
      name: 'iPad Pro 12.9-inch',
      size: Size(1024, 1366),
    ),
    Device.tabletLandscape,
    Device.tabletPortrait,
  ];
}
