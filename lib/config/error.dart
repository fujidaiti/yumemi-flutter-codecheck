import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/common/errors/handlers.dart';
import 'package:yumemi_flutter_codecheck/common/errors/unkown_error_widget.dart';

void initializeErrorHandlers() {
  // リリースモードでは全てログに書き出す
  if (kReleaseMode) {
    ErrorWidget.builder = (details) {
      return UnkownErrorWidget(details.exception, details.stack);
    };
    FlutterError.onError = (details) {
      consumeError(details.exception, details.stack);
    };
  }
}
