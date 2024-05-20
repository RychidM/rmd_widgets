import 'package:intl/intl.dart';

class RmUtils {
  static String maskString(String input,
      {int start = 4, int? end = 8, String maskChar = '*'}) {
    if (end != null && end > input.length) {
      end = input.length;
    }

    final maskLength = (end ?? input.length) - start;
    final mask = maskChar * maskLength;

    return input.replaceRange(start, end, mask);
  }

    static String parseAmount(double amount) {
    final formatter = NumberFormat("#,##0.00");
    return formatter.format(amount);
  }
}
