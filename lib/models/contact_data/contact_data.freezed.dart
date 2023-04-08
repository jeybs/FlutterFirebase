// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactData _$ContactDataFromJson(Map<String, dynamic> json) {
  return _ContactData.fromJson(json);
}

/// @nodoc
mixin _$ContactData {
  @JsonKey(name: 'date_added')
  String get date_added => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactDataCopyWith<ContactData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactDataCopyWith<$Res> {
  factory $ContactDataCopyWith(
          ContactData value, $Res Function(ContactData) then) =
      _$ContactDataCopyWithImpl<$Res, ContactData>;
  @useResult
  $Res call({@JsonKey(name: 'date_added') String date_added});
}

/// @nodoc
class _$ContactDataCopyWithImpl<$Res, $Val extends ContactData>
    implements $ContactDataCopyWith<$Res> {
  _$ContactDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date_added = null,
  }) {
    return _then(_value.copyWith(
      date_added: null == date_added
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactDataCopyWith<$Res>
    implements $ContactDataCopyWith<$Res> {
  factory _$$_ContactDataCopyWith(
          _$_ContactData value, $Res Function(_$_ContactData) then) =
      __$$_ContactDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'date_added') String date_added});
}

/// @nodoc
class __$$_ContactDataCopyWithImpl<$Res>
    extends _$ContactDataCopyWithImpl<$Res, _$_ContactData>
    implements _$$_ContactDataCopyWith<$Res> {
  __$$_ContactDataCopyWithImpl(
      _$_ContactData _value, $Res Function(_$_ContactData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date_added = null,
  }) {
    return _then(_$_ContactData(
      date_added: null == date_added
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContactData implements _ContactData {
  const _$_ContactData({@JsonKey(name: 'date_added') this.date_added = ""});

  factory _$_ContactData.fromJson(Map<String, dynamic> json) =>
      _$$_ContactDataFromJson(json);

  @override
  @JsonKey(name: 'date_added')
  final String date_added;

  @override
  String toString() {
    return 'ContactData(date_added: $date_added)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactData &&
            (identical(other.date_added, date_added) ||
                other.date_added == date_added));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date_added);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactDataCopyWith<_$_ContactData> get copyWith =>
      __$$_ContactDataCopyWithImpl<_$_ContactData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactDataToJson(
      this,
    );
  }
}

abstract class _ContactData implements ContactData {
  const factory _ContactData(
      {@JsonKey(name: 'date_added') final String date_added}) = _$_ContactData;

  factory _ContactData.fromJson(Map<String, dynamic> json) =
      _$_ContactData.fromJson;

  @override
  @JsonKey(name: 'date_added')
  String get date_added;
  @override
  @JsonKey(ignore: true)
  _$$_ContactDataCopyWith<_$_ContactData> get copyWith =>
      throw _privateConstructorUsedError;
}
