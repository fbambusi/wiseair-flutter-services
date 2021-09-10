import 'package:wiseair_flutter_services/models/Sensor.dart';

import 'Location.dart';

class NotableSensors{
    static final Sensor duomo=Sensor(id:"aritest-001",location: NotableLocations.piazzaDelDuomo);
    static final Sensor castello=Sensor(id:"aritest-001",location: NotableLocations.piazzaDelDuomo);
    
    static Sensor get piazzaDelDuomo  => duomo;
    static Sensor get castelloSforzesco  => castello;
    
}