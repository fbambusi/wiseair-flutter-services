### Login

```dart
import 'package:wiseair_flutter_services/wiseair_flutter_services.dart';
final WiseairServices wiseairServices = WiseairServices();

WiseairCredentials credentials=UserCredentials(email:"example@wiseair.vision",password:"secret");

User me = await wiseairServices.instance.login(credentials:credentials);
```