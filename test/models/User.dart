import 'package:wiseair_flutter_services/models/Location.dart';
import 'package:wiseair_flutter_services/models/User.dart';

import 'Sensor.dart';

class NotableUsers{
  static User get userWithSensors   {
    User user= User(id: "aaaa-aaaa",email: "hello@example.com");
    user.sensors=[NotableSensors.piazzaDelDuomo,NotableSensors.castelloSforzesco];
    return user;
  }

  
}