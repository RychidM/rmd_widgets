import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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

  static Future<InternetConnectionStatus> checkConnectivity() async {
    if (kDebugMode) {
      print(
          'internet connection status is ${await InternetConnectionChecker().connectionStatus}');
    }
    return await InternetConnectionChecker().connectionStatus;
  }

  static Future<bool> hasInternetConnection() async {
    if (kDebugMode) {
      print(
          'internet connection status is ${await InternetConnectionChecker().connectionStatus}');
    }
    return await InternetConnectionChecker().hasConnection;
  }
}
