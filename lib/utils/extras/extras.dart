import 'package:intl/intl.dart';

String getFormattedDate({required DateTime date}) {
  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
  return formattedDate;
}
