import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_clock_application/provider/alarmState.dart';
import 'package:my_clock_application/themes.dart';
import 'package:provider/provider.dart';

class WeekButton extends StatelessWidget {
  const WeekButton(
      {Key? key,
      required this.weekDay,
      required this.conditional,
      required this.providerConditonal})
      : super(key: key);
  final String weekDay;
  final bool conditional;
  final providerConditonal;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>providerConditonal(),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: (conditional) ? glowingYellow : Colors.transparent,
              width: (conditional)? 2: 0,
            )),
        alignment: Alignment.center,
        child: Text(
          weekDay,
          style: TextStyle(
            color: conditional ? glowingYellow : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
