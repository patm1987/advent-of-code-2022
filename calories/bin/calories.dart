import 'dart:io';

import 'package:calories/calories.dart';

Future<void> main(List<String> arguments) async {
  exitCode = 0;
  if (arguments.isEmpty) {
    print("Please specify a file to open");
    return;
  }

  var lines = await File(arguments[0]).readAsLines();
  print('Most Calories: ${parseCalories(lines, elfCount: 3)}');
}
