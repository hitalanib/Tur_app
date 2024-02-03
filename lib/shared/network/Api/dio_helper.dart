import 'package:dio/dio.dart';

class DioHelper {
  static  Dio ?dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl:'https://yehya-booking.mohamad-rasoul.website/api/mobile/' ,
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio?.options.headers=
    {
      'Content-Type':'application/json',
      'Accept':'application/json',
    };
    return await dio?.get(
      url,
    );
  }
  static Future<Response?> postData({
    required String url,
    required Map<String, dynamic>? data,
  }) async {
    dio?.options.headers=
    {
      'Content-Type':'application/json',
      'Accept':'application/json',
    };
    return await dio?.post(
      url,
      data: data,
    );
  }
  static Future<Response?> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? lang='en',
    String? token,
  }) async {
    dio?.options.headers=
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
    };
    return await dio?.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
