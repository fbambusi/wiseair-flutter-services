import 'package:wiseair_flutter_services/credentials/AppCredentials.dart';
import 'package:wiseair_flutter_services/credentials/Credentials.dart';

class UserCredentials extends Credentials {
  String username;
  String password;
  AppCredentials appCredentials;
  UserCredentials({this.username, this.password,this.appCredentials:BlankCredentials.instance});
}
