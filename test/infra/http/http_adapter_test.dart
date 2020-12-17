import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:faker/faker.dart';

class ClientSpy extends Mock implements Client {}

class HttpAdapter {
  final Client client;
  HttpAdapter(this.client);

  Future<void> request({@required url, @required method, Map body}) async {
    await client.post(url);
  }
}

void main() {
  group('post', () {
    test('Should call post with correct values', () async {
      final client = ClientSpy();
      final sut = HttpAdapter(client);
      final url = faker.internet.httpUrl();

      await sut.request(url: url, method: 'post');

      verify(client.post(url));
    });
  });
}
