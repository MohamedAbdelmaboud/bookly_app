import 'package:dio/dio.dart';

class ApiService {
   Dio dio = Dio();
  String baseUrl = 'https://www.googleapis.com/books/v1/';
 Future<Map<String,dynamic>> get({required String endPoint}) async {
    Response response = await dio.get('$baseUrl+$endPoint');
    return response.data;
  }
}
