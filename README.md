# CLI Spinner

Show your user that a longer running action did not hang. 

## Usage

```dart
void main() async {
  var spinner = Spinner.type("Testing this.", SpinnerType.dotScroll);
  spinner.start();
  await Future.delayed(Duration(milliseconds: 2000));
  spinner.setSpinnerType(SpinnerType.dots);
  spinner.updateMessage('First part done!');
  await Future.delayed(Duration(milliseconds: 2000));
  spinner.stop();
}
```

Only one Spinner at a time can be shown currently. 
