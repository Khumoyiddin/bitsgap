import 'package:dio/dio.dart';

const _kDefaultReceiveTimeout = 10000;
const _kDefaultConnectionTimeout = 10000;
const _baseUrl = 'https://rickandmortyapi.com/';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio()
          ..options.baseUrl = _baseUrl
          ..options.connectTimeout = Duration(milliseconds: _kDefaultConnectionTimeout)
          ..options.receiveTimeout = Duration(milliseconds: _kDefaultReceiveTimeout);

  Dio get dio => _dio;
}
