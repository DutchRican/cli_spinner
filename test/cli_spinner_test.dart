import 'package:cli_spinner/cli_spinner.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final spinner = Spinner('This is a test');

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(spinner.message, 'This is a test');
    });
  });
}
