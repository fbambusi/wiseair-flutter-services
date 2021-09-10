import 'package:wiseair_flutter_services/strategies/TimeFetchingStrategy.dart';

class MockedTimeFetchingStrategy extends TimeFetchingStrategy{

  MockedTimeFetchingStrategy._internal();

  static final MockedTimeFetchingStrategy _singleton = MockedTimeFetchingStrategy._internal();

  static MockedTimeFetchingStrategy get instance => _singleton;

  @override
  DateTime nowLocal()
  {
    return DateTime(2020,1,1,14);
  }
}