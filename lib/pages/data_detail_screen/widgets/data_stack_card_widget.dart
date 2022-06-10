import 'package:mechine_test/extra/exports.dart';
import 'package:url_launcher/url_launcher.dart';

class DataCardStackWidget extends StatelessWidget {
  const DataCardStackWidget({
    required this.snapshot,
    Key? key,
  }) : super(key: key);
  final AsyncSnapshot<IndividualUserDataModel?> snapshot;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: context.getSize().height * 0.6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: FittedBox(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TxtWidget(
                    textColor: white,
                    text:
                        'Name: ${snapshot.data!.title!}.${snapshot.data!.firstName!}${snapshot.data!.lastName!}',
                  ),
                  snapshot.data!.email == null
                      ? emptyBox
                      : GestureDetector(
                          onTap: () {
                            launchUrl(
                                Uri.parse('mailto:${snapshot.data!.email}'));
                          },
                          child: TxtWidget(
                              textColor: white,
                              decoration: TextDecoration.underline,
                              text: 'Email: ${snapshot.data!.email!}'),
                        ),
                  snapshot.data!.dateOfBirth == null
                      ? emptyBox
                      : TxtWidget(
                          textColor: white,
                          text:
                              'DOB: ${snapshot.data!.dateOfBirth?.substring(0, 10)}'),
                  snapshot.data!.gender == null
                      ? emptyBox
                      : TxtWidget(
                          textColor: white,
                          text: 'Gender: ${snapshot.data!.gender}'),
                  snapshot.data!.phone == null
                      ? emptyBox
                      : GestureDetector(
                          onTap: () async {
                            launchUrl(
                                Uri.parse('tel:${snapshot.data!.phone!}'));
                          },
                          child: TxtWidget(
                              textColor: white,
                              decoration: TextDecoration.underline,
                              text: 'Phone: ${snapshot.data!.phone}'),
                        )
                ],
              ),
            )),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: context.getSize().width * 0.4,
            child: FittedBox(
              child: CircleAvatar(
                backgroundImage: NetworkImage(snapshot.data!.picture!),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
