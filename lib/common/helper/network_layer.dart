import 'dart:developer';

import 'package:dio/dio.dart';
import '../util/constants/api_codes.dart';

class NetworkLayer {
  static NetworkLayer? _instance;

  NetworkLayer._internal();

  // String _url = ApiBaseUrl.BASE_URL;
  Dio _dio = Dio(BaseOptions(baseUrl: ApiBaseUrl.BASE_URL));

  Options _options = Options(
    sendTimeout: 5000,
    receiveTimeout: 3000,
  );

  factory NetworkLayer() {
    _instance = _instance ?? NetworkLayer._internal();
    return _instance!;
  }

  Future<dynamic> dioGet({required String apiPath,Map<String, dynamic>? queryParameters}) async {
    try{
      Response response = await _dio.get(apiPath,
          queryParameters: queryParameters,
          options: _options
      ).timeout(
          Duration(seconds: 60),
          onTimeout: () async {

            return Future.delayed(Duration(seconds: 1));
          });
      log("******Response************(serviceId:${apiPath})\n${response.data.toString()}");
      return(response.data);
    }on DioError catch (ex) {
      log("${ex.response?.statusMessage?.toString()} ${ex.response?.statusCode?.toString()}");
      rethrow;
    }
  }

}