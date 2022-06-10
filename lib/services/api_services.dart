import 'package:mechine_test/extra/exports.dart';

class ApiServices {
  static const appiId = '61151dc619e074b995f40062';
  static Dio dio = Dio();
  static final dioOption=Options(headers: {'app-id': appiId});
  static const String baseUrl = 'https://dummyapi.io/data/v1/';
  static String getListOfUsers = 'user?limit=';
  static String getUser = 'user/';
}
