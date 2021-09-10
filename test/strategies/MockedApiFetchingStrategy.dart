import 'package:wiseair_flutter_services/credentials/Credentials.dart';
import 'package:wiseair_flutter_services/exceptions/NotLoggedInException.dart';
import 'package:wiseair_flutter_services/models/Model.dart';
import 'package:wiseair_flutter_services/models/Prediction.dart';
import 'package:wiseair_flutter_services/models/Sensor.dart';
import 'package:wiseair_flutter_services/models/User.dart';
import 'package:wiseair_flutter_services/queries/Query.dart';
import 'package:wiseair_flutter_services/strategies/ApiFetchingStrategy.dart';

import '../models/Prediction.dart';
import '../models/Sensor.dart';
import '../models/User.dart';

class MockedApiFetchingStrategy implements ApiFetchingStrategy{

  
  ApiFetchingStrategy apiFetchingStrategy;

  MockedApiFetchingStrategy._internal();

  static final MockedApiFetchingStrategy _singleton = MockedApiFetchingStrategy._internal();

  static MockedApiFetchingStrategy get instance => _singleton;

  @override
  Future<List<T>> query<T extends Model>(Query query) async {
    
    return <T>[];
  }

  Future<List<Sensor>> querySensors(Query query) async
  {
    return this._getNotableSensors();
  }

  @override
  Future<User> login(Credentials credentials) async {
    return NotableUsers.userWithSensors;
  }

  List<Sensor> _getNotableSensors(){
    return [NotableSensors.piazzaDelDuomo,NotableSensors.castelloSforzesco];
  }

  @override
  Future<List<Prediction>> queryPredictions(Query query) async
  {
    List<Prediction> returnValue=[];
    if (query.aggregation==Aggregation.day)
    {
        return NotablePredictionSequences().linearlyIncreasingPredictionsInDuomoDailyAggregation();
      
    }
    else
    {
      returnValue= NotablePredictionSequences().linearlyIncreasingPredictionsInDuomo();
    
    }

      
    return returnValue;
  }

  @override
  Future<List<SensorPrediction>> querySensorPredictions(Query query) async
  {
    if (query.aggregation==Aggregation.day)
    {
      return NotablePredictionSequences().linearlyIncreasingSensorPredictionsInDuomoDailyAggregation();
    }
    List<SensorPrediction> returnValue=[];
    returnValue= NotablePredictionSequences().linearlyIncreasingSensorPredictionsInDuomo();
    
    return returnValue;
  }

  @override
  Future<User> getMe() {
    throw NotLoggedInException();
  }
}