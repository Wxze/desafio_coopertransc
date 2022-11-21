import 'package:intl/intl.dart';

abstract class FormatDate {
  static String? formatDate(String? date) {
    if (date == null) return null;

    final DateTime parsedDate = DateTime.parse(date);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');

    final String formattedDate = formatter.format(parsedDate);

    return formattedDate.replaceAll('-', '/');
  }
}
