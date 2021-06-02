import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckWidgets
    extends Given3WithWorld<String, String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2, String input3) async {
    final textinput1 = find.byValueKey(input1);
    final textinput2 = find.byValueKey(input2);
    final button = find.byValueKey(input3);
    bool input1Exists =
        await FlutterDriverUtils.isPresent(world.driver, textinput1);
    bool input2Exists = await FlutterDriverUtils.isPresent(
      world.driver,
      textinput2,
    );
    bool buttonExists =
        await FlutterDriverUtils.isPresent(world.driver, button);
    expect(input1Exists, true);
    expect(input2Exists, true);
    expect(buttonExists, true);
  }

  @override
  RegExp get pattern => RegExp(r"I have {string} and {string} and {string}");
}

class CheckOneWidget extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final widget1 = find.byValueKey(input1);
    bool widget1Exists =
        await FlutterDriverUtils.isPresent(world.driver, widget1);

    expect(widget1Exists, true);
  }

  @override
  RegExp get pattern => RegExp(r"I have {string}");
}

class TapButtonNTimesStep extends When2WithWorld<String, int, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r"I tap the {string} button {int} time(?:s|)");

  @override
  Future<void> executeStep(String buttonKey, int amount) async {
    final locator = find.byValueKey(buttonKey);
    for (var i = 0; i < amount; i += 1) {
      await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
    }
  }
}

class TapButtonStep extends When1WithWorld<String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");

  @override
  Future<void> executeStep(String buttonKey) async {
    final locator = find.byValueKey(buttonKey);
    await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
  }
}

class GivenCounterIsSetTo extends Given1WithWorld<String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r"I expect the counter to be {string}");

  @override
  Future<void> executeStep(String expectedCounter) async {
    final locator = find.byValueKey("counterText");
    final actualCount =
        await FlutterDriverUtils.getText(world.driver!, locator);
    expectMatch(actualCount, expectedCounter);
  }
}

class ExpectFound extends Given2WithWorld<String, String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r"I expect found {string} {string}");

  @override
  Future<void> executeStep(String widget, String value) async {
    final locator = find.byValueKey(widget);
    final actualValue =
        await FlutterDriverUtils.getText(world.driver!, locator);
    expectMatch(actualValue, value);
  }
}
