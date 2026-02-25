import 'package:hijri_calendar/hijri_calendar.dart';
import 'package:intl/intl.dart';

/// function to get today's date
String getTodayDate() {
  return DateFormat.yMMMMd().format(
    DateTime.now(),
  );
}

/// function to get the islamic date,
String getIslamicDate() {
  return HijriCalendarConfig.now().toFormat("dd MMMM, yyyy");
}
