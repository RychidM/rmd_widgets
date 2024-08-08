import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class RmSimpleLogPrinter extends LogPrinter {
  final String className;
  final bool printCallingFunctionName;
  final bool printCallStack;
  final List<String> excludeLogsFromClasses;
  final String? showOnlyClass;

  RmSimpleLogPrinter({
    this.className = '',
    this.printCallingFunctionName = false,
    this.printCallStack = false,
    this.excludeLogsFromClasses = const [],
    this.showOnlyClass,
  });

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter().levelColors?[event.level];
    var emoji = PrettyPrinter().levelEmojis?[event.level];
    var methodName = _getMethodName();
    var methodNameSection =
        printCallingFunctionName && methodName != null ? ' | $methodName' : '';
    var stackLog = event.stackTrace.toString();
    var output =
        '$emoji $className$methodNameSection - ${event.message}${printCallStack ? '\nSTACKTRACE:\n$stackLog' : ''}';

    if (excludeLogsFromClasses
            .any((excludeClass) => className == excludeClass) ||
        (showOnlyClass != null && className != showOnlyClass)) {
      return [];
    }

    final pattern = RegExp('.{1,800}');
    List<String> result = [];

    for (var line in output.split('\n')) {
      result.addAll(
        pattern.allMatches(line).map(
          (match) {
            if (kReleaseMode) {
              return match.group(0)!;
            } else {
              if (color != null) return color('$emoji ${match.group(0)}');
              return '$emoji ${match.group(0)}';
            }
          },
        ),
      );
    }

    return result;
  }

  String? _getMethodName() {
    try {
      var currentStack = StackTrace.current;
      var formattedStackTrace = _formatStackTrace(currentStack, 3);

      var realFirstLine =
          formattedStackTrace?.firstWhere((line) => line.contains(className));

      var methodName = realFirstLine?.replaceAll('$className.', '');
      return methodName;
    } catch (e) {
      return null;
    }
  }

  final stackTraceRegex = RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

  List<String>? _formatStackTrace(StackTrace currentStack, int methodCount) {
    var lines = currentStack.toString().split('\n');

    var formatted = <String>[];

    var count = 0;
    for (var line in lines) {
      var match = stackTraceRegex.matchAsPrefix(line);
      if (match != null) {
        if (match.group(2)!.startsWith('package:logger')) {
          continue;
        }
        var newLine = ("${match.group(1)}");
        formatted.add(newLine.replaceAll('<anonymous closure>', '()'));
        if (count == methodCount) {
          break;
        }
      } else {
        formatted.add(line);
      }
    }

    if (formatted.isEmpty) {
      return null;
    } else {
      return formatted;
    }
  }
}
