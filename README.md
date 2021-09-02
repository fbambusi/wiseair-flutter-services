# Wiseair Flutter Services

An API to access Wiseair's air quality data.

## Features

- **Air quality data** out of the box: install the package, insert your credentials and get access to the air you breathe.  
- **Concise and expressive syntax** to let you focus on your application: the package will take care of the rest! 
- **Low-level API** available for non-standardized interaction. 

## Installation

Add a dependency to your pubspec.yml, then run ```flutter pub get``` to install it.

```yml
dependencies:
  wiseair_flutter_services:
```

## Usage

- [Login](#Login) 
- [Get air quality data from user sensors](#get-air-quality-data-from-user-sensors)
- [Get air quality data for a specific location](#get-air-quality-data-for-specific-location)

### Login
```dart
import 'package:wiseair_flutter_services/wiseair_flutter_services.dart';
final WiseairServices wiseairServices = WiseairServices();

WiseairCredentials credentials=UserCredentials(email:"example@wiseair.vision",password:"secret");

User me = await wiseairServices.instance.login(credentials:credentials);
```

### Get air quality data from user sensors
```dart
import 'package:wiseair_flutter_services/wiseair_flutter_services.dart';
final WiseairServices wiseairServices = WiseairServices();

WiseairCredentials credentials=UserCredentials(email:"example@wiseair.vision",password:"secret");

User me = await wiseairServices.instance.login(credentials:credentials);
List<Sensor> mySensors = await wiseairServices.instance.getMySensors();

Interval interval=Interval(dateStart=Datetime(2021,10,10,12),dateEnd=Datetime(2021,10,10,15));

for(Sensor sensor in mySensors){
    List<Prediction> predictions=await WiseairServices.instance.getSensorDailyPredictions(sensor:sensor,interval:interval);
}
```

### Get air quality data for specific location

```dart
import 'package:wiseair_flutter_services/wiseair_flutter_services.dart';
final WiseairServices wiseairServices = WiseairServices();

WiseairCredentials credentials=UserCredentials(email:"example@wiseair.vision",password:"secret");
await wiseairServices.instance.login(credentials:credentials);

Location location=Location(latitude:45.070,longitude:7.686);
Interval interval=Interval(dateStart=Datetime(2021,10,10,12),dateEnd=Datetime(2021,10,10,15));

List<Prediction> predictions=await WiseairServices.instance.getLocationPredictions(location:location,interval:interval);
```

## What's next?

Read our [API documentation](https://ido.readme.io) to learn more on the concepts used in this package. 
Drop us a line at [contact@wiseair.vision](mailto:contact@wiseair.vision) for any feedback or question on the package!