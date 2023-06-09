import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class DateTable extends StatefulWidget {
  const DateTable({Key? key}) : super(key: key);

  @override
  State<TableCalendar> createState() => _TableCalendarState();
}

class _TableCalendarState extends State<TableCalendar> {

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
          focusedDay: dateTime,
          firstDay: DateTime.utc(2023, 5, 1),
          lastDay: DateTime.utc(2024, 1, 1)),
    );
  }
}
