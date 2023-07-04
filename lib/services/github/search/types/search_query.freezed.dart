// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchQuery {
  String get keywords => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchQueryCopyWith<SearchQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchQueryCopyWith<$Res> {
  factory $SearchQueryCopyWith(
          SearchQuery value, $Res Function(SearchQuery) then) =
      _$SearchQueryCopyWithImpl<$Res, SearchQuery>;
  @useResult
  $Res call({String keywords});
}

/// @nodoc
class _$SearchQueryCopyWithImpl<$Res, $Val extends SearchQuery>
    implements $SearchQueryCopyWith<$Res> {
  _$SearchQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keywords = null,
  }) {
    return _then(_value.copyWith(
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchQueryCopyWith<$Res>
    implements $SearchQueryCopyWith<$Res> {
  factory _$$_SearchQueryCopyWith(
          _$_SearchQuery value, $Res Function(_$_SearchQuery) then) =
      __$$_SearchQueryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String keywords});
}

/// @nodoc
class __$$_SearchQueryCopyWithImpl<$Res>
    extends _$SearchQueryCopyWithImpl<$Res, _$_SearchQuery>
    implements _$$_SearchQueryCopyWith<$Res> {
  __$$_SearchQueryCopyWithImpl(
      _$_SearchQuery _value, $Res Function(_$_SearchQuery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keywords = null,
  }) {
    return _then(_$_SearchQuery(
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchQuery extends _SearchQuery with DiagnosticableTreeMixin {
  const _$_SearchQuery({required this.keywords}) : super._();

  @override
  final String keywords;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchQuery(keywords: $keywords)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchQuery'))
      ..add(DiagnosticsProperty('keywords', keywords));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchQuery &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keywords);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchQueryCopyWith<_$_SearchQuery> get copyWith =>
      __$$_SearchQueryCopyWithImpl<_$_SearchQuery>(this, _$identity);
}

abstract class _SearchQuery extends SearchQuery {
  const factory _SearchQuery({required final String keywords}) = _$_SearchQuery;
  const _SearchQuery._() : super._();

  @override
  String get keywords;
  @override
  @JsonKey(ignore: true)
  _$$_SearchQueryCopyWith<_$_SearchQuery> get copyWith =>
      throw _privateConstructorUsedError;
}
