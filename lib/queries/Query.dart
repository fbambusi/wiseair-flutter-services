import 'package:wiseair_flutter_services/models/Location.dart';
import 'package:wiseair_flutter_services/models/Sensor.dart';

enum Aggregation
{
  none,
  hour,
  day,
  week,
  month,
  year
}

class Interval {
  final DateTime dateInitial;
  final DateTime dateFinal;
  Interval({this.dateInitial,this.dateFinal});
}

class Query {
  final Interval interval;
  final Location location;
  final Sensor sensor;
  final Aggregation aggregation;
  Query({this.interval,this.location,this.sensor,this.aggregation});

  
}

class SensorsQuery extends Query {
  SensorsQuery({interval,sensor,aggregation}):super(interval:interval,sensor:sensor,aggregation: aggregation);
  

}