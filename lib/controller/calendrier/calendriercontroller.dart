import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  final focusedDate = DateTime.now().obs;

  void onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    focusedDate.value = first;
  }
}