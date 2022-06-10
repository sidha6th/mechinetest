import 'package:mechine_test/extra/exports.dart';

class UserDataListController extends GetxController {
  RxList<UserData?> allUserData = <UserData?>[].obs;
  final scrollController = ScrollController();
  List<UserData> searchList = [];
  bool isVisible = false;
  bool isFinished = false;
  bool isloadedAllData = false;

  getAllUser(int? limit, {bool isLoadMore = false}) async {
    try {
      if (isLoadMore == false) {
        isFinished = false;
      }
      final response = await ApiServices.dio.get(
          ApiServices.baseUrl + ApiServices.getListOfUsers + limit.toString(),
          options: ApiServices.dioOption);
      if (response.statusCode == 200 &&
          UserDataListModel.fromJson(response.data).data != null) {
        if (limit == null) {
          searchList = UserDataListModel.fromJson(response.data).data!;
        }
        if (limit != null && limit > 10) {
          allUserData.value = UserDataListModel.fromJson(response.data).data!;
          isVisible = false;
          if (isLoadMore == false) {
            isFinished = true;
          }
          update();
          return;
        } else {
          allUserData.value = UserDataListModel.fromJson(response.data).data!;
          update();
          debugPrint(UserDataListModel.fromJson(response.data)
              .data!
              .length
              .toString());
          return;
        }
      }
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  search({required String textfieldValue}) {
    allUserData.clear();
    for (var element in searchList) {
      if ('${element.firstName}${element.lastName}'
          .toLowerCase()
          .contains(textfieldValue.toLowerCase())) {
        allUserData.add(
          UserData(
            firstName: element.firstName,
            id: element.id,
            lastName: element.lastName,
            picture: element.picture,
            title: element.title,
          ),
        );
      }
    }
    update();
  }

  loadMore(limit) async {
    isVisible = true;
    update();
    await getAllUser(limit, isLoadMore: true);
  }
}
