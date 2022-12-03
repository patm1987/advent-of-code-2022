import 'dart:collection';
import 'dart:io';
import 'dart:math';

import 'package:calories/sorted_ring_buffer.dart';

int parseCalories(List<String> calorieList, {int elfCount = 1}) {
  // store results in a sorted tree
  List<int> solutionBuffer = [];

  var lastValue = calorieList.fold(0, (previousValue, element) {
    // try to parse each line
    var parsed = int.tryParse(element);
    if (parsed != null) {
      // parsed a value, sum!
      return previousValue + parsed;
    } else {
      // parsed an empty line... see if it's the largest
      if (previousValue != 0) {
        solutionBuffer.add(previousValue);
      }
      return 0;
    }
  });
  if (lastValue != 0) {
    solutionBuffer.add(lastValue);
  }
  solutionBuffer.sort(((a, b) => b - a));
  return solutionBuffer
      .take(elfCount)
      .fold(0, (previousValue, element) => previousValue + element);
}
