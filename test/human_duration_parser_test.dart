import 'package:duration_parser/human_duration_parser.dart';
import 'package:test/test.dart';

void main() {
  test("years test", () {
    final yearsResult = parseStringToDuration("1 years");
    final yearResult = parseStringToDuration("1 year");
    final yResult = parseStringToDuration("1y");

    expect(365, equals(yearsResult.inDays));
    expect(365, equals(yearResult.inDays));
    expect(365, equals(yResult.inDays));
  });

  test("months test", () {
    final monthsResult = parseStringToDuration("2 months");
    final monthResult = parseStringToDuration("1 month");
    final mResult = parseStringToDuration("3mon");

    expect(60, equals(monthsResult.inDays));
    expect(30, equals(monthResult.inDays));
    expect(90, equals(mResult.inDays));
  });

  test("days test", () {
    final daysResult = parseStringToDuration("2 days");
    final dayResult = parseStringToDuration("1 day");
    final dResult = parseStringToDuration("3d");

    expect(2, equals(daysResult.inDays));
    expect(1, equals(dayResult.inDays));
    expect(3, equals(dResult.inDays));
  });

  test("hours test", () {
    final hoursResult = parseStringToDuration("2 hours");
    final hourResult = parseStringToDuration("1 hour");
    final hResult = parseStringToDuration("3h");

    expect(2, equals(hoursResult.inHours));
    expect(1, equals(hourResult.inHours));
    expect(3, equals(hResult.inHours));
  });

  test("minutes test", () {
    final minutesResult = parseStringToDuration("2 minutes");
    final minuteResult = parseStringToDuration("1 minute");
    final minResult = parseStringToDuration("4 min");
    final mResult = parseStringToDuration("3m");

    expect(2, equals(minutesResult.inMinutes));
    expect(4, equals(minResult.inMinutes));
    expect(1, equals(minuteResult.inMinutes));
    expect(3, equals(mResult.inMinutes));
  });

  test("seconds test", () {
    final secondsResult = parseStringToDuration("2 seconds");
    final secondResult = parseStringToDuration("1 second");
    final secsResult = parseStringToDuration("4 secs");
    final secResult = parseStringToDuration("1 sec");
    final sResult = parseStringToDuration("3s");

    expect(2, equals(secondsResult.inSeconds));
    expect(4, equals(secsResult.inSeconds));
    expect(1, equals(secondResult.inSeconds));
    expect(1, equals(secResult.inSeconds));
    expect(3, equals(sResult.inSeconds));
  });
}
