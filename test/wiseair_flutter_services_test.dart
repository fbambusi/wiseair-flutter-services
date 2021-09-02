import 'package:flutter_test/flutter_test.dart';
import 'package:wiseair_flutter_services/entities/Sensor.dart';

import 'package:wiseair_flutter_services/wiseair_flutter_services.dart';

import 'strategies/MockedStrategy.dart';

void main() {
  test('my sensors have type sensor', () async {
    final calculator = WiseairServices.instance;
    WiseairServices.setApiFetchingStrategy(MockedApiFetchingStrategy());
    final sensors = await calculator.getMySensors();
    for (var sensor in sensors) {
      expect(true, sensor is Sensor);
    } 
  });

  
}
