import 'package:dio/dio.dart';
import 'package:newsapp/shared/components/constants.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    dio = Dio(BaseOptions(baseUrl: baseUrl,receiveDataWhenStatusError: true));
  }

  static Future<Response> getData({required String url,Map<String, dynamic>? query}) async{
    return await dio.get(url,queryParameters: query);
  }
}