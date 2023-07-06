import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:yumemi_flutter_codecheck/config/logging/debug_log_config.dart';
import 'package:yumemi_flutter_codecheck/config/logging/release_log_config.dart';

final logger = Logger("AppLog");

void initializeLogger() {
  const config = kReleaseMode ? ReleaseLogConfig() : DebugLogConfig();
  Logger.root
    ..level = config.level
    ..onRecord.listen(config.onRecord);
}

abstract interface class LogConfig {
  Level get level;
  void onRecord(LogRecord record);
}
