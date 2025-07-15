abstract class LicenseDateParser {
  const LicenseDateParser();

  DateTime? parse(String dateString);

  static const LicenseDateParser yearMonthDay = YearMonthDayLicenseDateParser();
  static const LicenseDateParser monthDayYear = MonthDayYearDateParser();
}

class YearMonthDayLicenseDateParser extends LicenseDateParser {
  const YearMonthDayLicenseDateParser();

  @override
  DateTime? parse(String dateString) {
    final yearPart = int.tryParse(dateString.substring(0, 4));
    final monthPart = int.tryParse(dateString.substring(4, 6));
    final dayPart = int.tryParse(dateString.substring(6, 8));
    if (monthPart != null && dayPart != null && yearPart != null) {
      return DateTime(yearPart, monthPart, dayPart);
    }

    return null;
  }
}

class MonthDayYearDateParser extends LicenseDateParser {
  const MonthDayYearDateParser();

  @override
  DateTime? parse(String dateString) {
    final monthPart = int.tryParse(dateString.substring(0, 2));
    final dayPart = int.tryParse(dateString.substring(2, 4));
    final yearPart = int.tryParse(dateString.substring(4, 8));
    if (monthPart != null && dayPart != null && yearPart != null) {
      return DateTime(yearPart, monthPart, dayPart);
    }

    return null;
  }
}
