// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_clock_application/themes.dart';

class Alarms extends StatelessWidget {
  const Alarms(
      {Key? key,
      required this.hours,
      required this.mins,
      required this.isWednesday,
      required this.isMonday,
      required this.isSunday,
      required this.isTuesday,
      required this.isThursday,
      required this.isFriday,
      required this.isAlarmOn,
      required this.handleAlarmOn,
      required this.isSaturday,
      required this.alarmRing,
      required this.snooze,
      required this.vibrate})
      : super(key: key);

  final int hours;
  final int mins;
  final bool isMonday;
  final bool isWednesday;
  final bool isThursday;
  final bool isFriday;
  final bool isSaturday;
  final bool isSunday;
  final bool isTuesday;
  final bool isAlarmOn;
  final handleAlarmOn;
  final bool alarmRing;
  final bool snooze;
  final bool vibrate; 

  @override
  Widget build(BuildContext context) {
    List daysData = [
      {"day": "S", "conditional": isSunday},
      {"day": "M", "conditional": isMonday},
      {"day": "T", "conditional": isTuesday},
      {"day": "W", "conditional": isWednesday},
      {"day": "T", "conditional": isThursday},
      {"day": "F", "conditional": isFriday},
      {"day": "S", "conditional": isSaturday},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SizedBox(width:20),
            (hours < 10)? Text(hours.toString().padLeft(2, "0"), style: TextStyle(color: Colors.white,fontSize: 35))
            : Text(hours.toString(),style: TextStyle(color: Colors.white,fontSize: 35) ),
            Text(":", style: TextStyle(color: Colors.white,fontSize: 35) ,),
            (mins < 10)? Text(mins.toString().padLeft(2, "0"), style: TextStyle(color: Colors.white,fontSize: 35))
            : Text(mins.toString(),style: TextStyle(color: Colors.white,fontSize: 35) ),

           
            SizedBox(width:110),
            Row(
              children: daysData
                  .map((e) => Text(
                        e["day"],
                        style: TextStyle(
                            color:
                                e["conditional"] ? glowingYellow : Colors.grey[600]),
                      ))
                  .toList(),
            ),
            Switch(
              value: isAlarmOn,
              onChanged: (value) => handleAlarmOn(value),
              activeColor: glowingYellow,
              activeTrackColor: Colors.grey[600],
              inactiveThumbColor: Colors.grey[600],
            )
          ],
        ),
      ),
    );
  }
}
