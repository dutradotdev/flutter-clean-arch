import 'package:enquete_dev/data/usecases/remote_authentication.dart';
import 'package:enquete_dev/domain/usecases/usecases.dart';
import 'package:enquete_dev/main/factories/http/api_url_factory.dart';
import 'package:enquete_dev/main/factories/http/http_client_factory.dart';

Authentication makeRemoteAuthentication() {
  return RemoteAuthentication(
      httpClient: makeHttpAdapter(), url: makeApiUrl('login'));
}
