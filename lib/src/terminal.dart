import 'dart:io';

import 'package:ansi_escapes/ansi_escapes.dart';

class Terminal {
  /// output the message with formatting
  static writeMessage(String message, List<dynamic> frames, int index) {
    stdout.write(
        '${ansiEscapes.eraseLine}\r${frames[index]} $message  ${ansiEscapes.cursorHide}');
  }

  /// output the final message with formatting turning the cursor back on
  static writeFinalMessage(String message) {
    stdout.writeln(
        '${ansiEscapes.eraseLine}\r$message ${ansiEscapes.cursorShow}');
  }
}
