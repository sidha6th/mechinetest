import 'package:mechine_test/extra/exports.dart';

class IndividalUserDataController {
  static Future<IndividualUserDataModel?> getIndividalUserData(
      {required String userId}) async {
    try {
      final res = await ApiServices.dio.get(
          ApiServices.baseUrl + ApiServices.getUser + userId,
          options: ApiServices.dioOption);
      if (res.statusCode == 200) {
        return IndividualUserDataModel.fromJson(res.data);
      }
      return null;
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
