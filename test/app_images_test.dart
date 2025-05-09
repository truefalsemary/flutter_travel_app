import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_travel_app/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.doubleGis).existsSync(), isTrue);
    expect(File(AppImages.yMaps).existsSync(), isTrue);
  });
}
