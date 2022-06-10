import 'package:mechine_test/extra/exports.dart';

class TxtWidget extends StatelessWidget {
  const TxtWidget({
    required this.text,
    this.textColor = blck,
    this.decoration = TextDecoration.none,
    Key? key,
  }) : super(key: key);
  final String text;
  final Color? textColor;
  final TextDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        decoration: decoration,
      ),
    );
  }
}
