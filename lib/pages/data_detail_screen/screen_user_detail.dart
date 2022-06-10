import 'package:mechine_test/extra/exports.dart';

class ScreenUserDataDetail extends StatelessWidget {
  const ScreenUserDataDetail({
    required this.userId,
    Key? key,
  }) : super(key: key);
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
          height: context.getSize().height * 0.7,
          child: FutureBuilder<IndividualUserDataModel?>(
            future: IndividalUserDataController.getIndividalUserData(
                userId: userId),
            builder:
                (context, AsyncSnapshot<IndividualUserDataModel?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.hasData
                    ? DataCardStackWidget(
                        snapshot: snapshot,
                      )
                    : const Center(
                        child: TxtWidget(text: 'No Data found'),
                      );
              } else {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Center(
                    child: TxtWidget(text: 'oops something went wrong'),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
