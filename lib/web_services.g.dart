// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _WebServices implements WebServices {
  _WebServices(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://gorest.co.in/public/v2/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<User>> getAllUsers() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(_setStreamType<List<User>>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, 'users',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => User.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<User> getUserById(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, 'users/${id}',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(result.data!);
    return value;
  }

  @override
  Future<User> createNewUser(newuser, token) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    data.addAll(newuser.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'POST', headers: headers, extra: extra)
            .compose(_dio.options, 'users',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(result.data!);
    return value;
  }

  @override
  Future<HttpResponse<dynamic>> deleteUser(id, token) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    final result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'DELETE', headers: headers, extra: extra)
            .compose(_dio.options, 'users/${id}',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = result.data;
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
