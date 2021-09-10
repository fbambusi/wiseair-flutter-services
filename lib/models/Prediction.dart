import 'package:wiseair_flutter_services/models/Model.dart';
import 'package:wiseair_flutter_services/models/Location.dart';
import 'package:wiseair_flutter_services/models/Sensor.dart';

class Prediction extends Model {
  Location location;
  int wiseIndex;
  DateTime dateStart;
  Prediction({this.location,this.dateStart,this.wiseIndex});


}

class SensorPrediction extends Prediction{

  Sensor sensor;

  SensorPrediction({Location location,DateTime dateValidity,int wiseIndex,Sensor sensor}): super(location:location,dateStart:dateValidity,wiseIndex:wiseIndex)
  {
    this.sensor=sensor;
  }

}