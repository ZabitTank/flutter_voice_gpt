import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_voice_gpt/core/values/constants.dart';
import 'package:flutter_voice_gpt/core/values/enum.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class APIHandlerInterface {
  Future<Response> get(String endpoint, {Map<String, dynamic>? query});
  Future<Response> post(var body, String endpoint,
      {Map<String, dynamic>? query});
  Future<Response> put(var body, String endpoint,
      {Map<String, dynamic>? query});

  Future<void> storeRefreshToken(String token);
  Future<void> storeAccessToken(String token);
  Future<void> storeAPIKey(String token);

  Future<String?> getRefreshToken();
  Future<String?> getAccessToken();
  Future<String?> getAPIKey();

  Future<void> deleteToken();
}

class APIHandlerImp implements APIHandlerInterface {
  static String host = APIPath.openAiHost;
  static const _storage = FlutterSecureStorage();
  static final client = Dio();

  static final APIHandlerImp _singleton = APIHandlerImp._internal();
  static APIHandlerImp get instance => _singleton;

  factory APIHandlerImp() {
    return _singleton;
  }

  APIHandlerImp._internal();

  Future<Map<String, String>> _buildHeader({
    bool useToken = false,
    TokenType tokenType = TokenType.apiToken,
  }) async {
    var baseHeader = {
      HttpHeaders.dateHeader: DateTime.now().millisecondsSinceEpoch.toString(),
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
    };
    if (useToken) {
      String? token = await _getTokenByType(tokenType);
      if (token != "") {
        baseHeader["Authorization"] = "Bearer $token";
      }
    }
    return baseHeader;
  }

  Future<String?> _getTokenByType(TokenType token) async {
    switch (token) {
      case TokenType.accessToken:
        return await getAccessToken();
      case TokenType.refreshToken:
        return await getRefreshToken();
      case TokenType.apiToken:
        return await getAPIKey();
    }
  }

  static Uri buildUrlWithQuery(String endpoint, Map<String, dynamic> query) {
    return query.isEmpty
        ? Uri.parse(host + endpoint).replace(queryParameters: query)
        : Uri.parse(host + endpoint);
  }

  @override
  Future<Response> post(
    var body,
    String endpoint, {
    bool useToken = false,
    Map<String, dynamic>? query,
  }) async {
    Response response = await client.post(host + endpoint,
        data: json.encode(body),
        queryParameters: query,
        options: Options(headers: await _buildHeader(useToken: useToken)));
    return response;
  }

  @override
  Future<Response> get(
    String endpoint, {
    bool useToken = false,
    Map<String, dynamic>? query,
  }) async {
    var header = await _buildHeader(useToken: useToken);
    Response response = await client.get(
      host + endpoint,
      queryParameters: query,
      options: Options(headers: header),
    );
    return response;
  }

  @override
  Future<Response> put(
    body,
    String endpoint, {
    bool useToken = false,
    Map<String, dynamic>? query,
  }) async {
    Response response = await client.put(
      host + endpoint,
      queryParameters: query,
      data: json.encode(body),
      options: Options(
        headers: await _buildHeader(useToken: useToken),
      ),
    );
    return response;
  }

  @override
  Future<String?> getAccessToken() async {
    return await _storage.read(key: "accessToken");
  }

  @override
  Future<void> storeAccessToken(String token) async {
    return await _storage.write(key: "accessToken", value: token);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: "refreshToken");
  }

  @override
  Future<void> storeRefreshToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  @override
  Future<void> storeAPIKey(String id) async {
    await _storage.write(key: "id", value: id);
  }

  @override
  Future<String?> getAPIKey() async {
    return await _storage.read(key: "id") ?? dotenv.env['OPEN_API_KEY'];
  }

  @override
  Future<void> deleteToken() async {
    await _storage.deleteAll();
  }
}
