import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'hooks/hook.dart';
import 'steps/test_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..stepDefinitions = [
      CheckGivenWidgets(),
      ExpectFound(),
      TapButtonNTimesStep(),
      TapButtonStep(),
      GivenCounterIsSetTo(),
    ]
    ..hooks = [
      HookExample(),
      AttachScreenshotOnFailedStepHook(),
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart";
  // ..keepAppRunningAfterTests = true;
  return GherkinRunner().execute(config);
}
