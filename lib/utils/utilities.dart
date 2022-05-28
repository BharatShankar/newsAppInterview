import 'package:intl/intl.dart';

String getFormatedDate(String _date) {
  if (_date != "") {
    DateTime todayDate = DateTime.parse(_date);
    var inputDate = DateTime.parse(todayDate.toString());
    var outputFormat = DateFormat('yyyy/MM/dd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  } else {
    return "";
  }
}
