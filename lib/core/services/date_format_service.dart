import 'package:intl/intl.dart';

class FomartDateTime {
  static String yMdHHmmSS24(DateTime dateTime) {
    return '${DateFormat("dd/MM/yyyy", "pt_BR").format(dateTime)} ${DateFormat(DateFormat.HOUR24_MINUTE_SECOND, "pt_BR").format(dateTime)}';
  }
}
