import 'package:flutter/foundation.dart';
import 'package:logger/web.dart';

class RmMultiLoggerOutput extends LogOutput {
  final List<LogOutput> logOutputs;

  RmMultiLoggerOutput(this.logOutputs);
  @override
  void output(OutputEvent event) {
    try {
      for (var logOutput in logOutputs) {
        logOutput.output(event);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Log output failed: $e');
      }
    }
  }
}
