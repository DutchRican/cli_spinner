import 'package:cli_spinner/cli_spinner.dart';

void main() async {
  /// Creating a spinner with default SpinnerType
  var spinner1 = Spinner('default spinner message');
  spinner1.start();
  await Future.delayed(Duration(seconds: 2));
  spinner1.updateMessage("Finished!");
  spinner1.stop();

  /// Creating a spinner with specified SpinnerType
  var spinner2 = Spinner.type("Testing this.", SpinnerType.dotScroll);
  spinner2.start();
  await Future.delayed(Duration(seconds: 2));
  spinner2.setSpinnerType(SpinnerType.dots);
  spinner2.updateMessage('First part done!');
  await Future.delayed(Duration(milliseconds: 1500));
  spinner2.stop();
}
