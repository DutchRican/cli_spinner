import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cli_spinner/cli_spinner.dart';
import 'package:path/path.dart' as p;
import 'package:ansi_escapes/ansi_escapes.dart';
import 'package:cli_spinner/src/spinners/models/spin_indicator.dart';

class Spinner {
  late bool _isBusy;
  late Timer? _timer;
  late String _spinnerType;
  late SpinIndicator _spinIndicator;
  late List<SpinIndicator> _availableSpinners;
  int _spinnerIndex = 0;

  bool get isBusy => _isBusy;
  String get message => _message;

  late String _message;

  Spinner(this._message) {
    _isBusy = false;
    _spinnerType = SpinnerType.standard.value;
    _availableSpinners = _getAvailableSpinners();
  }
  Spinner.type(this._message, SpinnerType spinnerType) {
    _isBusy = false;
    _spinnerType = spinnerType.value;
    _availableSpinners = _getAvailableSpinners();
  }

  setSpinnerType(SpinnerType spinnerType) {
    _spinnerType = spinnerType.value;
    var spinner = _availableSpinners.firstWhere((item) => item.name == _spinnerType);
    _spinnerIndex = 0;
    _spinIndicator = spinner;
    _timer?.cancel();
    _setTimer(spinner.interval);
  }

  start() {
    _spinnerIndex = 0;
    var spinner = _availableSpinners.firstWhere((item) => item.name == _spinnerType);
    _spinIndicator = spinner;
    _isBusy = true;
    _setTimer(spinner.interval);
  }

  stop() {
    _timer?.cancel();
    stdout.writeln('${ansiEscapes.eraseLine}\r$_message ${ansiEscapes.cursorShow}');
  }

  updateMessage(String message) {
    _message = message;
  }

  void _updateStatus() {
    stdout.write(
        '${ansiEscapes.eraseLine}\r${_spinIndicator.frames[_spinnerIndex]} $_message  ${ansiEscapes.cursorHide}');
    _spinnerIndex = (_spinnerIndex + 1) % _spinIndicator.frames.length;
  }

  void _setTimer(int interval) {
    _timer = Timer.periodic(Duration(milliseconds: interval), (timer) {
      _updateStatus();
    });
  }

  List<SpinIndicator> _getAvailableSpinners() {
    String path = p.join(p.current, 'lib', 'src', 'spinners', 'spinners.json');
    String raw = File(path).readAsStringSync();
    return (json.decode(raw) as List).map(
      (item) {
        return SpinIndicator.fromJson(item);
      },
    ).toList();
  }
}