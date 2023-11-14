// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  late FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  group('OnBoarding', () {
    final buttonNext = find.byValueKey('NEXT');
    final titlePage = find.byValueKey('title1');

    test('page1', () async {
      await driver.tap(buttonNext);
      expect(await driver.getText(titlePage), 'DELIVERED AT');
    });
    test('page2', () async {
      await driver.tap(buttonNext);
      expect(await driver.getText(titlePage), 'GRAB THE');
    });
    test('page3', () async {
      await driver.tap(buttonNext);

      final textFinder = find.byValueKey('search');
      expect(await driver.getText(textFinder), 'BUSCA');
    });
  });

  group('Home', () {
    var textField = find.byValueKey('search_field');
    test('search', () async {
      await driver.tap(textField);
      await driver.enterText('feijoada');
    });
  });

  // tearDownAll(() async {
  //   await driver.close();
  // });
}
