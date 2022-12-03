import 'package:calories/calories.dart';
import 'package:test/test.dart';

void main() {
  test('Calculates One', () {
    expect(parseCalories(["1"]), 1);
  });

  test('Calculate 2', () {
    expect(parseCalories(["1", "2"]), 3);
  });

  test('Handles blank line', () {
    expect(parseCalories(['1', '', '2', '3']), 5);
  });

  test('Handles winner first', () {
    expect(parseCalories(['1', '2', '3', '', '4']), 6);
  });
}
