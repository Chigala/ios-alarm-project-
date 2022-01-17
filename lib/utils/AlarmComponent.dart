// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_clock_application/themes.dart';

class AlarmComponent extends StatelessWidget {
  const AlarmComponent(
      {Key? key,
      required this.title,
      required this.name,
      required this.conditional,
      required this.providerFunction})
      : super(key: key);
  final String title;
  final String name;
  final bool conditional;
  final providerFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
              Text(name, style: TextStyle(fontSize: 15, color: glowingYellow))
            ],
          ),
          Switch(
            value: conditional,
            onChanged:(value)=> providerFunction(value) ,
            activeColor: glowingYellow,
            activeTrackColor: Colors.grey[600],
            inactiveThumbColor: Colors.grey[600],
          )
        ],
      ),
    );
  }
}
