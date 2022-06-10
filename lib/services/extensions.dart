import 'package:mechine_test/extra/exports.dart';

extension MediaQueryDatas on BuildContext {
  Size getSize() => MediaQuery.of(this).size;
}
