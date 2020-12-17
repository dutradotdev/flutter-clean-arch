import 'package:meta/meta.dart';

abstract class HttpClient {
  Future<void> request({@required url, @required method, Map body});
}
