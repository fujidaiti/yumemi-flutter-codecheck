import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_query.freezed.dart';

@freezed
class SearchQuery with _$SearchQuery {
  const factory SearchQuery({
    required String keywords,
  }) = _SearchQuery;

  const SearchQuery._();
}
