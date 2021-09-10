import 'package:wiseair_flutter_services/queries/Query.dart';
import 'package:wiseair_flutter_services/serializers/EntitySerializer.dart';
import 'package:wiseair_flutter_services/strategies/ApiFetchingStrategy.dart';

class HttpEntitySerializer extends EntitySerializer {
  String url;
  HttpEntitySerializer({String this.url: ""});
  
  QueryResult fetchQueryResult(Query q,String remoteRepo) {
    print("${this.url}/$remoteRepo");
    return QueryResult();
  }
}