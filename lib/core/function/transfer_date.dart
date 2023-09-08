import 'package:jiffy/jiffy.dart';

transferDate(DateTime dateTime) {
  return Jiffy.parse(dateTime.toString()).Hm;
}
