library wiseair_flutter_services;

import 'package:injector/injector.dart';
import 'package:wiseair_flutter_services/models/Location.dart';
import 'package:wiseair_flutter_services/models/Prediction.dart';
import 'package:wiseair_flutter_services/models/Sensor.dart';
import 'package:wiseair_flutter_services/models/User.dart';
import 'package:wiseair_flutter_services/queries/Query.dart';
import 'package:wiseair_flutter_services/strategies/ApiFetchingStrategy.dart';
import 'package:wiseair_flutter_services/strategies/TimeFetchingStrategy.dart';

import 'credentials/Credentials.dart';

class WiseairServices {

  
  WiseairServices._internal();

  static final WiseairServices _singleton = WiseairServices._internal();

  factory WiseairServices() {
    return _singleton;
  }

  static configure(ApiFetchingStrategy apiFetchingStrategy,TimeFetchingStrategy timeFetchingStrategy)
  {
    final injector = Injector.appInstance;
    

    
    injector.registerDependency<ApiFetchingStrategy>(() {
    return apiFetchingStrategy;
  });
  
    injector.registerDependency<TimeFetchingStrategy>(() {
    return timeFetchingStrategy;
  });
    
    

  }


  static WiseairServices get instance => _singleton;

  ApiFetchingStrategy get apiFetchingStrategy => Injector.appInstance.get<ApiFetchingStrategy>(); 
  TimeFetchingStrategy get timeFetchingStrategy => Injector.appInstance.get<TimeFetchingStrategy>(); 

  DateTime nowLocal()
  {
    return this.timeFetchingStrategy.nowLocal();
  }

  Interval lastHoursLocal(int hours)
  {
    return Interval(dateInitial: this.timeFetchingStrategy.hoursAgoLocal(hours),dateFinal:this.timeFetchingStrategy.nowLocal());
  }

  Future<User> login(Credentials credentials) async {
    return apiFetchingStrategy.login(credentials);
  }

  Future<List<Sensor>> getMySensors() async {
    Query query = SensorsQuery();
    return apiFetchingStrategy.querySensors(query);
  }

  Future<List<SensorPrediction>> getSensorData(
      Sensor sensor, Interval interval) async {
        Query query=SensorsQuery(sensor:sensor,interval:interval);

    return apiFetchingStrategy.querySensorPredictions(query); 
  }

  Future<List<SensorPrediction>> getSensorDailyData(
      Sensor sensor, Interval interval) async {
    SensorsQuery query=SensorsQuery(sensor:sensor,interval:interval,aggregation:Aggregation.day);

    return apiFetchingStrategy.querySensorPredictions(query); 
  }

  Future<List<SensorPrediction>> getSensorWeeklyData(
      Sensor sensor, Interval interval) async {
    return <SensorPrediction>[];
  }

  Future<List<SensorPrediction>> getSensorMonthlyData(
      Sensor sensor, Interval interval) async {
    return <SensorPrediction>[];
  }

  Future<List<Prediction>> getLocationData(
      Location location, Interval interval) async {
        Query query=Query(interval:interval,location:location);
    return apiFetchingStrategy.queryPredictions(query);
  }

  Future<List<Prediction>> getLocationDailyData(
      Location location, Interval interval) async {
    Query query=Query(interval:interval,location:location,aggregation: Aggregation.day);
    return apiFetchingStrategy.queryPredictions(query);
  }

  Future<List<Prediction>> getLocationWeeklyData(
      Location location, Interval interval) async {
    return <Prediction>[];
  }

  Future<List<Prediction>> getLocationMonthlyData(
      Location location, Interval interval) async {
    return <Prediction>[];
  }

  Future<User> getMe() async
  {
    return await apiFetchingStrategy.getMe();
  }
}
