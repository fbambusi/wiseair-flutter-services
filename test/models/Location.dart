import 'package:wiseair_flutter_services/models/Location.dart';

class NotableLocations{
  static Location duomo=Location(latitude: 45.464211,longitude: 9.191383,displayAddress: "Duomo",country: "italy",administrativeAreaLevel1: "lombardia",administrativeAreaLevel2: "MI",streetAddress: "piazza del duomo",streetNumber: "1");
  static Location castello=Location(latitude: 45.483333,longitude:9.166667,displayAddress: "Castello",country: "italy",administrativeAreaLevel1: "lombardia",administrativeAreaLevel2: "MI",streetAddress: "piazza castello",streetNumber: "1");

  static  Location get piazzaDelDuomo  => duomo;
  static  Location get castelloSforzesco =>castello;
}