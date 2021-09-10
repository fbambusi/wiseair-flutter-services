
import 'package:wiseair_flutter_services/queries/Query.dart';
import 'package:wiseair_flutter_services/serializers/EntitySerializer.dart';
import 'package:wiseair_flutter_services/serializers/HttpEntitySerializer.dart';
import 'package:wiseair_flutter_services/strategies/ApiFetchingStrategy.dart';

import '../Model.dart';

class ModelManager {
  
  EntitySerializer serializer=HttpEntitySerializer();
  
  String prefix="  ";
    
  EntityManager() {}

  Model fromRep(QueryResult a) {
    //https://flutter.dev/docs/development/data-and-backend/json#code-generation
    return Model();
  }
  
  String get remoteRepository  => ""+this.prefix;
  
  List<Model> fromQuery(Query q) {
    return <Model>[];
  }
  
   QueryResult fetchQueryResult(Query q)
  {
    return this.serializer.fetchQueryResult(q,this.remoteRepository);
  }
}