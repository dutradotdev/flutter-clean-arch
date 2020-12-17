import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:enquete_dev/domain/usecases/usecases.dart';
import 'package:enquete_dev/data/http/http.dart';
import 'package:enquete_dev/data/usecases/remote_authentication.dart';

// criação de um Spy com Mockito
class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    final params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
    await sut.auth(params);

    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.secret}));
  });
}
