import 'package:wiseair_flutter_services/credentials/Credentials.dart';
import 'package:wiseair_flutter_services/credentials/UserCredentials.dart';
import 'package:wiseair_flutter_services/models/User.dart';
import 'package:wiseair_flutter_services/wiseair_flutter_services.dart';


void main(List<String> args) async {

  Credentials credentials=UserCredentials(username:"example@wiseair.vision",password:"secret");

  User me = await WiseairServices.instance.login(credentials);
}
