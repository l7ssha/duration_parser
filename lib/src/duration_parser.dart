library duration_parser;

final yearsRegex = RegExp(r"(\d+)([ ]*)(years|year|y)");
final monthsRegex = RegExp(r"(\d+)([ ]*)(months|month|mon)");
final daysRegex = RegExp(r"(\d+)([ ]*)(days|day|d)");
final hoursRegex = RegExp(r"(\d+)([ ]*)(hours|hour|h)");
final minutesRegex = RegExp(r"(\d+)([ ]*)(minutes|minute|min|m)");
final secondsRegex = RegExp(r"(\d+)([ ]*)(seconds|second|secs|sec|s)");

Duration addTwoDurations(Duration first, Duration second) {
  return Duration(milliseconds: first.inMilliseconds + second.inMilliseconds);
}

Duration parseStringToDuration(
    String durationString,
    {
      bool matchYears = true,
      bool matchMonths = true,
      bool matchDays = true,
      bool matchHours = true,
      bool matchMinutes = true,
      bool matchSeconds = true,
      bool matchMilliSeconds = true,
    }
) {
  var duration = Duration();

  if (matchYears) {
    final yearMatch = yearsRegex.firstMatch(durationString);
    if (yearMatch != null) {
      final yearNumber = yearMatch.group(1);
      if (yearNumber != null) {
        duration = addTwoDurations(duration, Duration(days: 365 * int.parse(yearNumber)));
      }
    }
  }

  if (matchMonths) {
    final monthsMatch = monthsRegex.firstMatch(durationString);
    if (monthsMatch != null) {
      final monthNumber = monthsMatch.group(1);
      if (monthNumber != null) {
        duration = addTwoDurations(duration, Duration(days: 30 * int.parse(monthNumber)));
      }
    }
  }

  if (matchDays) {
    final daysMatch = daysRegex.firstMatch(durationString);
    if (daysMatch != null) {
      final daysNumber = daysMatch.group(1);
      if (daysNumber != null) {
        duration = addTwoDurations(duration, Duration(days: int.parse(daysNumber)));
      }
    }
  }

  if (matchHours) {
    final hoursMatch = hoursRegex.firstMatch(durationString);
    if (hoursMatch != null) {
      final hoursNumber = hoursMatch.group(1);
      if (hoursNumber != null) {
        duration = addTwoDurations(duration, Duration(hours: int.parse(hoursNumber)));
      }
    }
  }

  if (matchMinutes) {
    final minutesMatch = minutesRegex.firstMatch(durationString);
    if (minutesMatch != null) {
      final minutesNumber = minutesMatch.group(1);
      if (minutesNumber != null) {
        duration = addTwoDurations(duration, Duration(minutes: int.parse(minutesNumber)));
      }
    }
  }

  if (matchSeconds) {
    final secondsMatch = secondsRegex.firstMatch(durationString);
    if (secondsMatch != null) {
      final secondNumber = secondsMatch.group(1);
      if (secondNumber != null) {
        duration = addTwoDurations(duration, Duration(seconds: int.parse(secondNumber)));
      }
    }
  }

  return duration;
}
