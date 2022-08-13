enum SpinnerType {
  standard,
  dots,
  track,
  clocks,
  dotScroll,
  boxCircle,
  equalizer,
  lunarCycle,
  bars,
  twister,
  weather,
}

extension SpinnerTypeExt on SpinnerType {
  String get value {
    switch (this) {
      case SpinnerType.standard:
        return 'standard';
      case SpinnerType.dots:
        return 'dots';
      case SpinnerType.track:
        return 'track';
      case SpinnerType.clocks:
        return 'clocks';
      case SpinnerType.dotScroll:
        return 'dotScroll';
      case SpinnerType.boxCircle:
        return 'boxCircle';
      case SpinnerType.equalizer:
        return 'equalizer';
      case SpinnerType.lunarCycle:
        return 'lunarCycle';
      case SpinnerType.bars:
        return 'bars';
      case SpinnerType.twister:
        return 'twister';
      case SpinnerType.weather:
        return 'weather';
    }
  }
}
