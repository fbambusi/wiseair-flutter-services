import 'package:wiseair_flutter_services/credentials/Credentials.dart';
import 'package:wiseair_flutter_services/models/Model.dart';
import 'package:wiseair_flutter_services/models/Location.dart';
import 'package:wiseair_flutter_services/models/Prediction.dart';
import 'package:wiseair_flutter_services/models/Sensor.dart';
import 'package:wiseair_flutter_services/models/User.dart';
import 'package:wiseair_flutter_services/queries/Query.dart';




class ApiFetchingStrategy {
  Future<List<T>> query<T extends Model>(Query query) async {
    throw UnimplementedError();
  }

  Future<List<Sensor>> querySensors(Query query) async {
    throw UnimplementedError();
  }

  Future<List<Prediction>> queryPredictions(Query query) async {
    throw UnimplementedError();
  }

  Future<List<SensorPrediction>> querySensorPredictions(Query query) async {
    throw UnimplementedError();
  }
  

  Future<User> login(Credentials credentials)  async {
    throw UnimplementedError();
  }

  Future<User> getMe() async 
  {
    throw UnimplementedError();
  }

}
