import 'package:flutter/material.dart';

class AlarmState extends ChangeNotifier {
  var hour = 0;
  var min = 0;
  bool isWednesday = false;
  bool isMonday = false;
  bool isTuesday = false;
  bool isThursday = false;
  bool isFriday = false;
  bool isSaturday = false;
  bool isSunday = false;
  bool alarmRing = false;
  bool vibrate = false;
  bool snooze = false;

  // int getHour() => hour;
  // setHour(int value) => value = hour;
  // getIsWednesday() => isWednesday;
  // setIsWednesday(bool value) => value = isWednesday;
  // bool getIsSunday() => isSunday;
  // setIsSunday(bool value) => value = isSunday;
  // getIsMonday() => isMonday;
  // setIsMonday(bool value) => value = isMonday;
  // bool getIsTuesday() => isTuesday;
  // setIsTuesday(bool value) => value = isTuesday;
  // getIsThursday() => isThursday;
  // setIsThursday(bool value) => value = isThursday;
  // getIsFriday() => isFriday;
  // setIsFriday(bool value) => value = isFriday;
  // getIsSaturday() => isSaturday;
  // setIsSaturday(bool value) => value = isSaturday;

  void handleChangeHour(int index) {
    hour = index;
    notifyListeners();
  }

  void changeMonday() {
    isMonday = !isMonday;
    notifyListeners();
  }

  void changeTuesday() {
    isTuesday = !isTuesday;
    notifyListeners();
  }

  void changeWednesday() {
    isWednesday = !isWednesday;
    notifyListeners();
  }

  void changeThursday() {
    isThursday = !isThursday;
    notifyListeners();
  }

  void changeFriday() {
    isFriday = !isFriday;
    notifyListeners();
  }

  void changeSaturday() {
    isSaturday = !isSaturday;
    notifyListeners();
  }

  void changeSunday() {
    isSunday = !isSunday;
    notifyListeners();
  }

  void handleAlarmRing(value) {
    alarmRing = value;
    notifyListeners();
  }

  void handleSnooze(value) {
    snooze = value;
    notifyListeners();
  }

  void handleVibrate(value) {
    vibrate = value;
    notifyListeners();
  }
}
