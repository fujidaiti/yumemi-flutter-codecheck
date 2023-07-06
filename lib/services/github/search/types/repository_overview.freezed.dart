// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepositoryOverview {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get owner => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  int get stars => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepositoryOverviewCopyWith<RepositoryOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryOverviewCopyWith<$Res> {
  factory $RepositoryOverviewCopyWith(
          RepositoryOverview value, $Res Function(RepositoryOverview) then) =
      _$RepositoryOverviewCopyWithImpl<$Res, RepositoryOverview>;
  @useResult
  $Res call(
      {String name,
      String? description,
      String owner,
      String? avatarUrl,
      String? language,
      int stars});
}

/// @nodoc
class _$RepositoryOverviewCopyWithImpl<$Res, $Val extends RepositoryOverview>
    implements $RepositoryOverviewCopyWith<$Res> {
  _$RepositoryOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? owner = null,
    Object? avatarUrl = freezed,
    Object? language = freezed,
    Object? stars = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepositoryOverviewCopyWith<$Res>
    implements $RepositoryOverviewCopyWith<$Res> {
  factory _$$_RepositoryOverviewCopyWith(_$_RepositoryOverview value,
          $Res Function(_$_RepositoryOverview) then) =
      __$$_RepositoryOverviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      String owner,
      String? avatarUrl,
      String? language,
      int stars});
}

/// @nodoc
class __$$_RepositoryOverviewCopyWithImpl<$Res>
    extends _$RepositoryOverviewCopyWithImpl<$Res, _$_RepositoryOverview>
    implements _$$_RepositoryOverviewCopyWith<$Res> {
  __$$_RepositoryOverviewCopyWithImpl(
      _$_RepositoryOverview _value, $Res Function(_$_RepositoryOverview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? owner = null,
    Object? avatarUrl = freezed,
    Object? language = freezed,
    Object? stars = null,
  }) {
    return _then(_$_RepositoryOverview(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RepositoryOverview
    with DiagnosticableTreeMixin
    implements _RepositoryOverview {
  const _$_RepositoryOverview(
      {required this.name,
      required this.description,
      required this.owner,
      required this.avatarUrl,
      required this.language,
      required this.stars});

  @override
  final String name;
  @override
  final String? description;
  @override
  final String owner;
  @override
  final String? avatarUrl;
  @override
  final String? language;
  @override
  final int stars;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RepositoryOverview(name: $name, description: $description, owner: $owner, avatarUrl: $avatarUrl, language: $language, stars: $stars)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RepositoryOverview'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('owner', owner))
      ..add(DiagnosticsProperty('avatarUrl', avatarUrl))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('stars', stars));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepositoryOverview &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.stars, stars) || other.stars == stars));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, description, owner, avatarUrl, language, stars);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepositoryOverviewCopyWith<_$_RepositoryOverview> get copyWith =>
      __$$_RepositoryOverviewCopyWithImpl<_$_RepositoryOverview>(
          this, _$identity);
}

abstract class _RepositoryOverview implements RepositoryOverview {
  const factory _RepositoryOverview(
      {required final String name,
      required final String? description,
      required final String owner,
      required final String? avatarUrl,
      required final String? language,
      required final int stars}) = _$_RepositoryOverview;

  @override
  String get name;
  @override
  String? get description;
  @override
  String get owner;
  @override
  String? get avatarUrl;
  @override
  String? get language;
  @override
  int get stars;
  @override
  @JsonKey(ignore: true)
  _$$_RepositoryOverviewCopyWith<_$_RepositoryOverview> get copyWith =>
      throw _privateConstructorUsedError;
}
