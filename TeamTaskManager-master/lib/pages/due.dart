import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

class Due extends StatefulWidget{
  @override
  DueState createState()=> DueState();
  
  }

  class DueState extends State<Due> {
  CalendarController _calendarController; 
  @override
void initState() {
  super.initState();
  _calendarController = CalendarController();
}

@override
void dispose() {
  _calendarController.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) {
  return TableCalendar(
    calendarController: _calendarController,
  );
}

  }

