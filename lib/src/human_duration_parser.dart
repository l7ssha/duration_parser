library duration_parser;

final yearsRegex = RegExp(r"(\d+)([ ]*)(years|year|y)");
final monthsRegex = RegExp(r"(\d+)([ ]*)(months|month|mon)");
final daysRegex = RegExp(r"(\d+)([ ]*)(days|day|d)");
final hoursRegex = RegExp(r"(\d+)([ ]*)(hours|hour|h)");
final minutesRegex = RegExp(r"(\d+)([ ]*)(minutes|minute|min|m)");
final secondsRegex = RegExp(r"(\d+)([ ]*)(seconds|second|secs|sec|s)");

Duration _computeYears(int years) {
  final now = DateTime.now();
  final target = now.copyWith(year: now.year + years);

  return target.difference(now);
}

Duration _computeMonths(int months) {
  final now = DateTime.now();
  final target = now.copyWith(month: now.month + months);

  return target.difference(now);
}

Duration? parseStringToDuration(
  String durationString, {
  bool matchYears = true,
  bool matchMonths = true,
  bool matchDays = true,
  bool matchHours = true,
  bool matchMinutes = true,
  bool matchSeconds = true,
  bool matchMilliSeconds = true,
  bool allowNegative = true,
}) {
  var duration = Duration.zero;
  bool parsed = false;

  final elements = <RegExp, Duration Function(int amount)>{
    if (matchYears) yearsRegex: _computeYears,
    if (matchMonths) monthsRegex: _computeMonths,
    if (matchDays) daysRegex: (amount) => const Duration(days: 1) * amount,
    if (matchHours) hoursRegex: (amount) => const Duration(hours: 1) * amount,
    if (matchMinutes) minutesRegex: (amount) => const Duration(minutes: 1) * amount,
    if (matchSeconds) secondsRegex: (amount) => const Duration(seconds: 1) * amount,
  };

  for (final entry in elements.entries) {
    final pattern = entry.key;
    final value = entry.value;

    final match = pattern.firstMatch(durationString);
    if (match != null) {
      final amountText = match.group(1);
      assert(amountText != null, 'Invalid pattern was provided');

      final amount = int.tryParse(amountText!);
      if (amount != null) {
        duration += value(amount);
        parsed = true;
      }
    }
  }

  if (!parsed) {
    return null;
  }

  if (!allowNegative && duration < Duration.zero) {
    return null;
  }

  return duration;
}
