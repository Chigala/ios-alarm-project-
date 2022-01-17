// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../themes.dart';

class DateTimes extends StatelessWidget {
  const DateTimes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Text(DateFormat.yMEd().add_jms().format(DateTime.now()), style: TextStyle(
      color: glowingYellow,
      fontSize: 20,
      fontFamily: "roboto",
      fontWeight: FontWeight.bold
    ),);
  }
}