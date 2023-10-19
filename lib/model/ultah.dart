import 'package:flutter/foundation.dart';

class BirthdayModel extends ChangeNotifier {
  DateTime _birthday = DateTime(2023, 10, 19, 8, 16);
  DateTime get birthday => _birthday;
  Duration get timeUntilBirthday => _birthday.difference(DateTime.now());
}
