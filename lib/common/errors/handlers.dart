import 'package:yumemi_flutter_codecheck/config/logging/logging.dart';

/// [error]が[Error]の場合は再throw、例外（もしくはその他）の場合はログに出力する。
void handleError(Object error, StackTrace? stackTrace) {
  switch ((error, stackTrace)) {
    case (Error error, null):
      throw error;
    case (Error error, StackTrace stackTrace):
      Error.throwWithStackTrace(error, stackTrace);
    default:
      logger.severe("Caught an exception", error, stackTrace);
  }
}

/// [handleError]と違い、常にログへ出力する。
void consumeError(Object error, StackTrace? stackTrace) {
  try {
    handleError(error, stackTrace);
    // ignore: avoid_catches_without_on_clauses
  } catch (error) {
    assert(error is Error);
    logger.shout("Caught an error", error, stackTrace);
  }
}
