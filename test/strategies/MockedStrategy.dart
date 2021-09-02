import 'package:wiseair_flutter_services/entities/Entity.dart';
import 'package:wiseair_flutter_services/entities/Sensor.dart';
import 'package:wiseair_flutter_services/entities/User.dart';
import 'package:wiseair_flutter_services/strategies/ApiFetchingStrategy.dart';

class MockedApiFetchingStrategy implements ApiFetchingStrategy{

    ApiFetchingStrategy apiFetchingStrategy;

  MockedApiFetchingStrategy._internal();

  static final MockedApiFetchingStrategy _singleton = MockedApiFetchingStrategy._internal();

  factory MockedApiFetchingStrategy() {
    return _singleton;
  }

  static MockedApiFetchingStrategy get instance => _singleton;

  @override
  Future<List<T>> query<T extends Entity>(Query query) async {
    
    return <T>[];
  }

  Future<List<Sensor>> querySensors(Query query) async
  {
    return [new Sensor()];
  }

  @override
  Future<User> login(Credentials credentials) async {
    // TODO: implement login
    throw UnimplementedError();
  }

}