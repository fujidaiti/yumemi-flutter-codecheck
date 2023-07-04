// `--dart-define`で指定する環境変数群

final dataType = DataType.values.byName(
  const String.fromEnvironment("DataType", defaultValue: "real"),
);

enum DataType { real, fake }
