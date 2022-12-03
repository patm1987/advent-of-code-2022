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

  test('Handles three elves', () {
    expect(parseCalories(['1', '', '2', '', '3'], elfCount: 3), 6);
  });

  test('Handles duplicates', () {
    expect(parseCalories(['1', '', '1', '', '1'], elfCount: 3), 3);
  });

  final largeSample = '''1000
2000
3000

4000

5000
6000

7000
8000
9000

10000''';

  test('Finds the top 3', () {
    expect(parseCalories(largeSample.split('\n'), elfCount: 3), 45000);
  });
}
