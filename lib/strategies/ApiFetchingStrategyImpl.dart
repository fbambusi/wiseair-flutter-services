import 'package:wiseair_flutter_services/credentials/Credentials.dart';
import 'package:wiseair_flutter_services/models/User.dart';
import 'package:wiseair_flutter_services/strategies/ApiFetchingStrategy.dart';

class ApiFetchingStrategyImpl extends ApiFetchingStrategy
{
  @override
  Future<User> login(Credentials credentials)  async {
    throw UnimplementedError();
  }
}