library wiseair_flutter_services;

import 'package:wiseair_flutter_services/entities/Location.dart';
import 'package:wiseair_flutter_services/entities/Prediction.dart';
import 'package:wiseair_flutter_services/entities/Sensor.dart';
import 'package:wiseair_flutter_services/entities/User.dart';
import 'package:wiseair_flutter_services/strategies/ApiFetchingStrategy.dart';

class WiseairServices {

  ApiFetchingStrategy apiFetchingStrategy;

  WiseairServices._internal();

  static final WiseairServices _singleton = WiseairServices._internal();

  factory WiseairServices() {
    return _singleton;
  }

  static WiseairServices get instance => _singleton;
  
  static setApiFetchingStrategy(ApiFetchingStrategy strategy)
  {
    _singleton.apiFetchingStrategy=strategy;
  }


  Future<User> login(Credentials credentials) async{
    return apiFetchingStrategy.login(credentials);
  }

  Future<List<Sensor>> getMySensors() async {
    Query query = SensorsQuery();
    return apiFetchingStrategy.querySensors(query);
  }

  Future<List<Prediction>> getSensorData(Sensor sensor,Interval interval) async {
    return <Prediction>[];
  }

  Future<List<Prediction>> getSensorDailyData(Sensor sensor,Interval interval) async {
    return <Prediction>[];
  }

  Future<List<Prediction>> getSensorWeeklyData(Sensor sensor,Interval interval) async {
    return <Prediction>[];
  }

  Future<List<Prediction>> getSensorMonthlyData(Sensor sensor,Interval interval) async {
    return <Prediction>[];
  }

  Future<List<Prediction>> getLocationData(Location location,Interval interval) async {
    return <Prediction>[];
  }

  Future<List<Prediction>> getLocationDailyData(Location location,Interval interval) async {
    return <Prediction>[];
  }

  Future<List<Prediction>> getLocationWeeklyData(Location location,Interval interval) async {
    return <Prediction>[];
  }

  Future<List<Prediction>> getLocationMonthlyData(Location location,Interval interval) async {
    return <Prediction>[];
  }

}
