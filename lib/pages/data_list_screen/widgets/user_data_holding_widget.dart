import 'package:mechine_test/extra/exports.dart';

class UserDataLIstHoldingWidget extends StatelessWidget {
  const UserDataLIstHoldingWidget({
    Key? key,
    required this.userDataController,
  }) : super(key: key);

  final UserDataListController userDataController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () {
          return userDataController.getAllUser(15);
        },
        child: GetBuilder<UserDataListController>(
          builder: (controller) {
            return controller.isFinished
                ? controller.allUserData.isNotEmpty
                    ? ListView.builder(
                        controller: userDataController.scrollController,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.allUserData.length + 1,
                        itemBuilder: (_, index) {
                          return index != controller.allUserData.length
                              ? ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(controller
                                        .allUserData[index]!.picture!),
                                  ),
                                  title: TxtWidget(
                                      text:
                                          '${controller.allUserData[index]!.title}.${controller.allUserData[index]!.firstName!}'),
                                  subtitle: TxtWidget(
                                      text: controller
                                          .allUserData[index]!.lastName!),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ScreenUserDataDetail(
                                            userId: controller
                                                .allUserData[index]!.id!),
                                      ),
                                    );
                                  },
                                )
                              : const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical:10.0),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                        },
                      )
                    : const Center(
                        child: TxtWidget(text: 'No Data Found'),
                      )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
          },
        ),
      ),
    );
  }
}
