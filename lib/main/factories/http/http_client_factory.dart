import 'package:enquete_dev/data/http/http_client.dart';
import 'package:enquete_dev/infra/http/http_adapter.dart';
import 'package:http/http.dart';

HttpClient makeHttpAdapter() {
  return HttpAdapter(Client());
}
