class AlarmObject {
  var getHour = 0;
  var getMin = 0;
  bool wednesday = false;
  bool monday = false;
  bool tuesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;
  bool getAlarmRing = false;
  bool getVibrate = false;
  bool getSnooze = false;

  AlarmObject(
      {required this.getHour,
      required this.wednesday,
      required this.getMin,
      required this.monday,
      required this.tuesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.sunday,
      required this.getAlarmRing,
      required this.getVibrate,
      required this.getSnooze});
}
