import 'package:logging/logging.dart';
import 'package:yumemi_flutter_codecheck/config/logging/debug_log_config.dart';
import 'package:yumemi_flutter_codecheck/config/logging/logging.dart';

class ReleaseLogConfig implements LogConfig {
  const ReleaseLogConfig();

  @override
  Level get level => Level.SEVERE;

  @override
  void onRecord(LogRecord record) {
    // TODO; もっと良い方法でログを出す
    const DebugLogConfig().onRecord(record);
  }
}
