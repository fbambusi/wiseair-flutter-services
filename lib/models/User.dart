import 'package:wiseair_flutter_services/models/Model.dart';
import 'package:wiseair_flutter_services/models/Location.dart';
import 'package:wiseair_flutter_services/models/Sensor.dart';

enum UserSettingState { accepted, rejected }

class User extends Model {
  User({
    this.id,
    this.email,
    this.marketingState: UserSettingState.rejected,
    this.thirdPartyMarketingState: UserSettingState.rejected,
    this.profilationState: UserSettingState.rejected,
    this.newsletterState: UserSettingState.rejected,
  });

  String id;
  String email;
  UserSettingState marketingState;
  UserSettingState thirdPartyMarketingState;
  UserSettingState profilationState;
  UserSettingState newsletterState;
  List<Location> savedLocations;
  List<Sensor> sensors;
}
