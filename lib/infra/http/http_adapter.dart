import 'dart:convert';

import 'package:enquete_dev/data/http/http_client.dart';
import 'package:enquete_dev/data/http/http_error.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class HttpAdapter implements HttpClient {
  final Client client;
  HttpAdapter(this.client);

  Future<Map> request({@required url, @required method, Map body}) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);
    try {
      if (method == 'post') {
        response = await client.post(url, headers: headers, body: jsonBody);
      }
    } catch (error) {
      throw HttpError.serverError;
    }
    return _handleResponse(response);
  }

  Map _handleResponse(Response response) {
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      return response.body.isEmpty ? null : jsonDecode(response.body);
    } else if (statusCode == 204) {
      return null;
    } else if (statusCode == 400) {
      throw HttpError.badRequest;
    } else if (statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (statusCode == 403) {
      throw HttpError.forbidden;
    } else if (statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}
