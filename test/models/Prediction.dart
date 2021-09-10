import 'package:wiseair_flutter_services/models/Prediction.dart';

import '../strategies/MockedTimeFetchingStrategy.dart';
import 'Location.dart';
import 'Sensor.dart';

class NotablePredictionSequences{
  List<Prediction> _plainLinearlyIncreasingPredictionsInDuomo (){
    int numberOfPredictionsToGenerate=60;
    DateTime initial = MockedTimeFetchingStrategy.instance.nowLocal().subtract(Duration(hours: numberOfPredictionsToGenerate));

    return List<Prediction>.generate(numberOfPredictionsToGenerate, (i) =>
    Prediction(location: NotableLocations.piazzaDelDuomo,dateStart: 
      DateTime.utc(
        initial.year,
        initial.month,
        initial.day,
        initial.hour,
        initial.second
      ).add(Duration(hours: i)),wiseIndex: i+1));
  }

  List<Prediction> _plainDailyLinearlyIncreasingPredictionsInDuomo (){
    int numberOfPredictionsToGenerate=60;
    DateTime nowUtc= MockedTimeFetchingStrategy.instance.nowLocal();
    DateTime dateFinal = DateTime(
      nowUtc.year,
      nowUtc.month,
      nowUtc.day
    );

    DateTime initial = dateFinal.subtract(Duration(days: numberOfPredictionsToGenerate));
    
    return List<Prediction>.generate(numberOfPredictionsToGenerate, (i) =>
    Prediction(location: NotableLocations.piazzaDelDuomo,dateStart: 
      DateTime(
        initial.year,
        initial.month,
        initial.day,
        initial.hour,
        initial.second
      ).add(Duration(days: i+1)),wiseIndex: i+1));
  }

  List<Prediction> linearlyIncreasingPredictionsInDuomo (){
    return this._plainLinearlyIncreasingPredictionsInDuomo();
  }


  List<Prediction> linearlyIncreasingPredictionsInDuomoDailyAggregation (){
    return this._plainDailyLinearlyIncreasingPredictionsInDuomo();
  }

  List<SensorPrediction> linearlyIncreasingSensorPredictionsInDuomo (){
    List<Prediction> plainPredictions= this._plainLinearlyIncreasingPredictionsInDuomo();
    return plainPredictions.map((e) => SensorPrediction(location:e.location, dateValidity:e.dateStart, wiseIndex:e.wiseIndex,sensor:NotableSensors.piazzaDelDuomo)).toList();
  }

  List<SensorPrediction> linearlyIncreasingSensorPredictionsInDuomoDailyAggregation (){
    List<Prediction> plainPredictions= this._plainDailyLinearlyIncreasingPredictionsInDuomo();
    return plainPredictions.map((e) => SensorPrediction(location:e.location, dateValidity:e.dateStart, wiseIndex:e.wiseIndex,sensor:NotableSensors.piazzaDelDuomo)).toList();
  }

}