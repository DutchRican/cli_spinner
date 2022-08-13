class SpinIndicator {
  final String name;
  final int interval;
  final List<dynamic> frames;

  SpinIndicator.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        interval = parsedJson['interval'],
        frames = parsedJson['frames'];
}
