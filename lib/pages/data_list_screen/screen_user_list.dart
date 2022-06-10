import 'package:mechine_test/extra/exports.dart';

class ScreenUserDataList extends StatefulWidget {
  const ScreenUserDataList({Key? key}) : super(key: key);

  @override
  State<ScreenUserDataList> createState() => _ScreenUserDataListState();
}

class _ScreenUserDataListState extends State<ScreenUserDataList> {
  late final UserDataListController userDataController;
  @override
  void initState() {
    userDataController = Get.put(UserDataListController());
    super.initState();
    userDataController.getAllUser(15);
    int limit = 10;
    userDataController.scrollController.addListener(
      () {
        if (userDataController.scrollController.position.maxScrollExtent ==
            userDataController.scrollController.offset) {
          limit = limit + 10;
          userDataController.loadMore(limit);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blck,
        title: const TxtWidget(
          text: 'USER LIST',
          textColor: white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const TxtWidget(
              text: 'All team members',
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoSearchTextField(
              placeholder: 'Search',
              onTap: () {
                userDataController.getAllUser(null);
              },
              onChanged: (String? value) {
                if (value != null && value.isNotEmpty) {
                  userDataController.search(textfieldValue: value);
                } else {
                  userDataController.getAllUser(15);
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            UserDataLIstHoldingWidget(userDataController: userDataController),
          ],
        ),
      ),
    );
  }
}
