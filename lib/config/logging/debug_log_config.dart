import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:yumemi_flutter_codecheck/config/logging/logging.dart';

class DebugLogConfig implements LogConfig {
  const DebugLogConfig();

  @override
  Level get level => Level.INFO;

  @override
  void onRecord(LogRecord record) {
    final message = record.message;
    final header = "[${record.level.name}] [${record.time}]";
    switch ((record.error, record.stackTrace)) {
      case (final error?, null):
        debugPrint("$header $message\n\n$error");
      case (final error?, final stackTrace?):
        final trace = Trace.format(stackTrace);
        debugPrint("$header $message\n\n$error\n\n$trace");
      default:
        debugPrint("$header $message");
    }
  }
}
