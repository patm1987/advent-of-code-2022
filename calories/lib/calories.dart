import 'dart:io';
import 'dart:math';

int parseCalories(List<String> calorieList) {
  int largestValue = 0;
  var lastValue = calorieList
      .fold(0, (previousValue, element){
        // try to parse each line
        var parsed = int.tryParse(element);
        if (parsed != null) {
          // parsed a value, sum!
          return previousValue + parsed;
        } else {
          // parsed an empty line... see if it's the largest
          if (previousValue > largestValue) {
            largestValue = previousValue;
          }
          return 0;
        }
      });
    return max(largestValue, lastValue);
}
