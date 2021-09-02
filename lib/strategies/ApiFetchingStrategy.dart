import 'package:wiseair_flutter_services/entities/Entity.dart';
import 'package:wiseair_flutter_services/entities/Sensor.dart';
import 'package:wiseair_flutter_services/entities/User.dart';

class Interval{}

class Query{
  
}

class SensorsQuery extends Query{}

class Credentials{}

class ApiFetchingStrategy{

  Future<List<T>> query<T extends Entity>(Query query) async{
    return <T>[];
  }

  Future<List<Sensor>> querySensors(Query query) async{
    
  }

  Future<User> login(Credentials credentials) async {return new User();}
}