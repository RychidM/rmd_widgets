import 'package:flutter/foundation.dart';
import 'package:logger/web.dart';
import 'package:rmdev_widgets/network/multi_logger_output.dart';
import 'package:rmdev_widgets/network/rm_simple_logger_printer.dart';

class LogInDebugModeFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return kReleaseMode ? false : true;
  }
}

Logger rmGetLogger(
  String className, {
  bool printCallingFunctionName = true,
  bool printCallStack = false,
  List<String> excludeLogsFromClasses = const [],
  String? showOnlyClass,
}) {
  return Logger(
    filter: LogInDebugModeFilter(),
    printer: RmSimpleLogPrinter(
      className: className,
      printCallingFunctionName: printCallingFunctionName,
      printCallStack: printCallStack,
      showOnlyClass: showOnlyClass,
      excludeLogsFromClasses: excludeLogsFromClasses,
    ),
    output: RmMultiLoggerOutput([
      ConsoleOutput(),
    ]),
  );
}
