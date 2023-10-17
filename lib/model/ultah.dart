import 'package:flutter/foundation.dart';
import 'package:flutter_countdown_timer/index.dart';

class BirthdayModel extends ChangeNotifier {
  DateTime _birthday = DateTime(2023, 10, 28);
  DateTime get birthday => _birthday;
  Duration get timeUntilBirthday => _birthday.difference(DateTime.now());

  DateTime _startTime = DateTime.now();
  int _countdownDuration = 1; // Durasi countdown dalam menit
  DateTime get endTime => _startTime.add(Duration(minutes: _countdownDuration));
  int get remainingTime => endTime.difference(DateTime.now()).inSeconds;

  CountdownTimerController? _controller;
  CountdownTimerController? get controller => _controller;
  bool get isCountdownRunning => _controller!.isRunning;
}
