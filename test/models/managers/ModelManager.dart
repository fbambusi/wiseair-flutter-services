import 'package:flutter_test/flutter_test.dart';
import 'package:wiseair_flutter_services/models/Model.dart';
import 'package:wiseair_flutter_services/models/Sensor.dart';
import 'package:wiseair_flutter_services/models/managers/ModelManager.dart';
import 'package:wiseair_flutter_services/queries/Query.dart';
import 'package:wiseair_flutter_services/strategies/ApiFetchingStrategy.dart';

import 'package:wiseair_flutter_services/wiseair_flutter_services.dart';


void main() {
  


  test('return variables of fromQuery method are models', () async {
    ModelManager mm=ModelManager();
    List<Model> models=mm.fromQuery(Query());
    for(var model in models)
    {
      expect(model is Model,true);
    }
  });
}
