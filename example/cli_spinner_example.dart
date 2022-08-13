import 'package:cli_spinner/cli_spinner.dart';

void main() async {
  var spinner = Spinner.type("Testing this.", SpinnerType.dotScroll);
  spinner.start();
  await Future.delayed(Duration(milliseconds: 2000));
  spinner.setSpinnerType(SpinnerType.dots);
  spinner.updateMessage('First part done!');
  await Future.delayed(Duration(milliseconds: 2000));
  spinner.stop();
}
