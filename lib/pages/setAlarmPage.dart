// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_clock_application/provider/alarmState.dart';
import 'package:my_clock_application/themes.dart';
import 'package:my_clock_application/utils/AlarmComponent.dart';
import 'package:my_clock_application/utils/button.dart';
import 'package:provider/provider.dart';

class SetAlarmPage extends StatefulWidget {
  const SetAlarmPage({Key? key}) : super(key: key);

  @override
  _SetAlarmPageState createState() => _SetAlarmPageState();
}

class _SetAlarmPageState extends State<SetAlarmPage> {
  var alarmState;
  int _currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 1) {
      Provider.of<AlarmState>(context, listen: false).addAlarmToArray();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer.run(() {
    // alarmState = Provider.of<AlarmState>(context);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedFontSize: 20,
        selectedFontSize: 20,
        selectedItemColor: glowingYellow,
        unselectedItemColor: Colors.white,
        backgroundColor: backgroundColor,
        currentIndex: _currentIndex,
        onTap: changeIndex,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              size: 0,
            ),
            label: 'cancel',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              size: 0,
            ),
            label: 'save',
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: Consumer<AlarmState>(builder: (context, store, child) {
          List days = [
            {
              'day': "S",
              'method': store.changeSunday,
              'condition': store.isSunday
            },
            {
              'day': 'M',
              'method': store.changeMonday,
              'condition': store.isMonday
            },
            {
              'day': 'T',
              'method': store.changeTuesday,
              'condition': store.isTuesday
            },
            {
              'day': 'W',
              'method': store.changeWednesday,
              'condition': store.isWednesday
            },
            {
              'day': 'T',
              'method': store.changeThursday,
              'condition': store.isThursday
            },
            {
              'day': 'F',
              'method': store.changeFriday,
              'condition': store.isFriday
            },
            {
              'day': 'S',
              'method': store.changeSaturday,
              'condition': store.isSaturday
            },
          ];

          List alarmInfo = [
            {
              "title": "Alarm Sound",
              "name": "Basic Bell",
              "condition": store.alarmRing,
              "method": store.handleAlarmRing
            },
            {
              "title": "Vibrate",
              "name": "Basic call",
              "condition": store.vibrate,
              "method": store.handleVibrate
            },
            {
              "title": "snooze",
              "name": "5mins, 3times",
              "condition": store.snooze,
              "method": store.handleSnooze
            },
          ];

          return Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 200,
                      child: ListWheelScrollView(
                        itemExtent: 70,
                        physics: FixedExtentScrollPhysics(),
                        magnification: 3,
                        overAndUnderCenterOpacity: 0.1,
                        onSelectedItemChanged: (index) {
                          store.handleChangeHour(index);
                        },
                        children: <Widget>[
                          for (int i = 0; i < 24; i++)
                            MyItem(
                              index: i,
                            )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: SizedBox(
                        child: Text(
                          ":",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 200,
                      child: ListWheelScrollView(
                        itemExtent: 70,
                        physics: FixedExtentScrollPhysics(),
                        magnification: 3,
                        overAndUnderCenterOpacity: 0.1,
                        onSelectedItemChanged: (index) {
                          store.handleChangeHour(index);
                        },
                        children: <Widget>[
                          for (int i = 0; i < 60; i++)
                            MyItem(
                              index: i,
                            )
                        ],
                      ),
                    ),
                    Text(
                      "${store.hour}",
                      style: TextStyle(color: glowingYellow),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Mon, Tue, Wed",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: days
                              .map((e) => WeekButton(
                                  weekDay: e['day'],
                                  conditional: e['condition'],
                                  providerConditonal: e['method']))
                              .toList()),
                      Column(
                          children: alarmInfo
                              .map((e) => AlarmComponent(
                                  title: e["title"],
                                  name: e["name"],
                                  conditional: e["condition"],
                                  providerFunction: e['method']))
                              .toList()),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class MyItem extends StatelessWidget {
  final int index;

  const MyItem({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Center(
          child: (index < 10)
              ? Text(index.toString().padLeft(2, "0"),
                  style: TextStyle(color: glowingYellow, fontSize: 30))
              : Text('$index',
                  style: TextStyle(color: glowingYellow, fontSize: 30))),
    );
  }
}
