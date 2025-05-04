import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_travel_app/resources/resources.dart';

void main() {
  test('app_vectors assets test', () {
    expect(File(AppVectors.add).existsSync(), isTrue);
    expect(File(AppVectors.bookmark).existsSync(), isTrue);
    expect(File(AppVectors.cityIcon).existsSync(), isTrue);
    expect(File(AppVectors.comment).existsSync(), isTrue);
    expect(File(AppVectors.heartFilled).existsSync(), isTrue);
    expect(File(AppVectors.heartOutlined).existsSync(), isTrue);
    expect(File(AppVectors.home).existsSync(), isTrue);
    expect(File(AppVectors.person).existsSync(), isTrue);
    expect(File(AppVectors.search).existsSync(), isTrue);
  });
}
