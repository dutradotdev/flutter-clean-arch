import 'package:meta/meta.dart';

abstract class HttpClient {
  Future<Map> request({@required url, @required method, Map body});
}
