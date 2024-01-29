import 'package:dio/dio.dart';

class ApiService {
  final Dio dio ;
  String baseUrl = 'https://www.googleapis.com/books/v1/';
  ApiService({required this.dio});
 Future<Map<String,dynamic>> get({required String endPoint}) async {
    Response response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
