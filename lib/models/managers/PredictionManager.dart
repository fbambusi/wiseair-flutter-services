import 'package:wiseair_flutter_services/models/Prediction.dart';
import 'package:wiseair_flutter_services/models/managers/ModelManager.dart';
import 'package:wiseair_flutter_services/queries/Query.dart';
import 'package:wiseair_flutter_services/serializers/EntitySerializer.dart';
import 'package:wiseair_flutter_services/strategies/ApiFetchingStrategy.dart';

class PredictionManager extends ModelManager {
  String prefix="predictions";
  PredictionManager()  {}

  @override
  Prediction fromRep(QueryResult a) {
    //long and cumbersome serialization
    //very long
    return Prediction();
  }

  @override
  List<Prediction> fromQuery(Query q) {
    //Same in every subclass
    QueryResult qr = this.fetchQueryResult(q);
    return List<Prediction>.generate(
        1, (i) => PredictionManager().fromRep(qr));
  }
}