import 'package:flutter_test/flutter_test.dart';
import 'package:wiseair_flutter_services/credentials/UserCredentials.dart';
import 'package:wiseair_flutter_services/models/Prediction.dart';
import 'package:wiseair_flutter_services/models/Sensor.dart';
import 'package:wiseair_flutter_services/models/User.dart';


import 'package:wiseair_flutter_services/wiseair_flutter_services.dart';

import 'models/Location.dart';
import 'models/Sensor.dart';
import 'strategies/MockedApiFetchingStrategy.dart';
import 'strategies/MockedTimeFetchingStrategy.dart';

void main() {
  WiseairServices.configure(MockedApiFetchingStrategy.instance, MockedTimeFetchingStrategy.instance);

  test('my sensors have type sensor', () async {
    final ws = WiseairServices.instance;
    
    final sensors = await ws.getMySensors();
    for (var sensor in sensors) {
      expect(true, sensor is Sensor);
    } 
  });
  

  test('predictions have correct spacetime coordinates', () async {
    final ws = WiseairServices.instance;

    final predictions = await ws.getLocationData(NotableLocations.piazzaDelDuomo, ws.lastHoursLocal(60));
    expect(predictions.length, 60);
    for (var prediction in predictions) {
      expect(prediction.location,NotableLocations.piazzaDelDuomo);
      expect(true, !prediction.dateStart.isBefore(ws.lastHoursLocal(60).dateInitial) );
      expect(true,! prediction.dateStart.isAfter(ws.lastHoursLocal(60).dateFinal) );
      expect(true,prediction.wiseIndex > 0);
    } 
  });
  

  test('predictions have correct sensor', () async {
    final ws = WiseairServices.instance;
    
    final List<SensorPrediction> predictions = await ws.getSensorData(NotableSensors.piazzaDelDuomo, ws.lastHoursLocal(60));
    expect(predictions.length, 60);
    for (var prediction in predictions) {
      expect(prediction.location,NotableLocations.piazzaDelDuomo);
      
      expect(true, !prediction.dateStart.isBefore(ws.lastHoursLocal(60).dateInitial) );
      expect(true,! prediction.dateStart.isAfter(ws.lastHoursLocal(60).dateFinal) );
      expect(true,prediction.wiseIndex > 0);
    } 
  });

  test('get me raises exception when not logged in', () async {
    final ws = WiseairServices.instance;
    try{
      await ws.getMe();
      expect(false, true);
    }
    catch(NotLoggedInException )
    {
      expect(true, true);
    }
  });

  test('login returns user', () async {
    final ws = WiseairServices.instance;
    expect(await ws.login(UserCredentials(username: "hello",password: "hello")) is User,true);
    
  });
  
  test('daily predictions in Milan start at local midnight', () async {
    final ws = WiseairServices.instance;

    List<Prediction> preds=await ws.getLocationDailyData(NotableLocations.castello, ws.lastHoursLocal(24*30));

    DateTime expectedLastStartDay=DateTime(2020,1,1);

    expect(preds.last.dateStart,expectedLastStartDay);

    for(Prediction pred in preds)
    {
      expect(pred.dateStart.hour,0);
    }
    
  });


  test('daily sensor predictions in Milan start at local midnight', () async {
    final ws = WiseairServices.instance;

    List<Prediction> preds=await ws.getSensorDailyData(NotableSensors.castello, ws.lastHoursLocal(24*30));

    DateTime expectedLastStartDay=DateTime(2020,1,1);

    expect(preds.last.dateStart,expectedLastStartDay);

    for(Prediction pred in preds)
    {
      expect(pred.dateStart.hour,0);
    }
    
  });
}
