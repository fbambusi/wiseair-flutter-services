import 'package:wiseair_flutter_services/models/Model.dart';
import 'package:wiseair_flutter_services/models/Location.dart';

class Sensor extends Model {
  Sensor({this.id, this.location});
  String id;
  Location location;
}
