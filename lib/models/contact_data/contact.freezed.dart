// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  UserData? get userData => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message')
  String get lastMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message_date')
  String get lastMessageDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_id')
  String get fromId => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_id')
  String get toId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {UserData? userData,
      @JsonKey(name: 'last_message') String lastMessage,
      @JsonKey(name: 'last_message_date') String lastMessageDate,
      @JsonKey(name: 'from_id') String fromId,
      @JsonKey(name: 'to_id') String toId});

  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = freezed,
    Object? lastMessage = null,
    Object? lastMessageDate = null,
    Object? fromId = null,
    Object? toId = null,
  }) {
    return _then(_value.copyWith(
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageDate: null == lastMessageDate
          ? _value.lastMessageDate
          : lastMessageDate // ignore: cast_nullable_to_non_nullable
              as String,
      fromId: null == fromId
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as String,
      toId: null == toId
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$_ContactCopyWith(
          _$_Contact value, $Res Function(_$_Contact) then) =
      __$$_ContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserData? userData,
      @JsonKey(name: 'last_message') String lastMessage,
      @JsonKey(name: 'last_message_date') String lastMessageDate,
      @JsonKey(name: 'from_id') String fromId,
      @JsonKey(name: 'to_id') String toId});

  @override
  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$_ContactCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$_Contact>
    implements _$$_ContactCopyWith<$Res> {
  __$$_ContactCopyWithImpl(_$_Contact _value, $Res Function(_$_Contact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = freezed,
    Object? lastMessage = null,
    Object? lastMessageDate = null,
    Object? fromId = null,
    Object? toId = null,
  }) {
    return _then(_$_Contact(
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageDate: null == lastMessageDate
          ? _value.lastMessageDate
          : lastMessageDate // ignore: cast_nullable_to_non_nullable
              as String,
      fromId: null == fromId
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as String,
      toId: null == toId
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contact implements _Contact {
  const _$_Contact(
      {this.userData = null,
      @JsonKey(name: 'last_message') this.lastMessage = "",
      @JsonKey(name: 'last_message_date') this.lastMessageDate = "",
      @JsonKey(name: 'from_id') this.fromId = "",
      @JsonKey(name: 'to_id') this.toId = ""});

  factory _$_Contact.fromJson(Map<String, dynamic> json) =>
      _$$_ContactFromJson(json);

  @override
  @JsonKey()
  final UserData? userData;
  @override
  @JsonKey(name: 'last_message')
  final String lastMessage;
  @override
  @JsonKey(name: 'last_message_date')
  final String lastMessageDate;
  @override
  @JsonKey(name: 'from_id')
  final String fromId;
  @override
  @JsonKey(name: 'to_id')
  final String toId;

  @override
  String toString() {
    return 'Contact(userData: $userData, lastMessage: $lastMessage, lastMessageDate: $lastMessageDate, fromId: $fromId, toId: $toId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contact &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageDate, lastMessageDate) ||
                other.lastMessageDate == lastMessageDate) &&
            (identical(other.fromId, fromId) || other.fromId == fromId) &&
            (identical(other.toId, toId) || other.toId == toId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userData, lastMessage, lastMessageDate, fromId, toId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      __$$_ContactCopyWithImpl<_$_Contact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactToJson(
      this,
    );
  }
}

abstract class _Contact implements Contact {
  const factory _Contact(
      {final UserData? userData,
      @JsonKey(name: 'last_message') final String lastMessage,
      @JsonKey(name: 'last_message_date') final String lastMessageDate,
      @JsonKey(name: 'from_id') final String fromId,
      @JsonKey(name: 'to_id') final String toId}) = _$_Contact;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$_Contact.fromJson;

  @override
  UserData? get userData;
  @override
  @JsonKey(name: 'last_message')
  String get lastMessage;
  @override
  @JsonKey(name: 'last_message_date')
  String get lastMessageDate;
  @override
  @JsonKey(name: 'from_id')
  String get fromId;
  @override
  @JsonKey(name: 'to_id')
  String get toId;
  @override
  @JsonKey(ignore: true)
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      throw _privateConstructorUsedError;
}
