// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'attachment')
  String get attachment => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_date')
  DateTime? get messageDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_id')
  String get fromId => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_id')
  String get toId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'attachment') String attachment,
      @JsonKey(name: 'message_date') DateTime? messageDate,
      @JsonKey(name: 'from_id') String fromId,
      @JsonKey(name: 'to_id') String toId});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? attachment = null,
    Object? messageDate = freezed,
    Object? fromId = null,
    Object? toId = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      messageDate: freezed == messageDate
          ? _value.messageDate
          : messageDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
}

/// @nodoc
abstract class _$$_MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_MessageCopyWith(
          _$_Message value, $Res Function(_$_Message) then) =
      __$$_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'attachment') String attachment,
      @JsonKey(name: 'message_date') DateTime? messageDate,
      @JsonKey(name: 'from_id') String fromId,
      @JsonKey(name: 'to_id') String toId});
}

/// @nodoc
class __$$_MessageCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_Message>
    implements _$$_MessageCopyWith<$Res> {
  __$$_MessageCopyWithImpl(_$_Message _value, $Res Function(_$_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? attachment = null,
    Object? messageDate = freezed,
    Object? fromId = null,
    Object? toId = null,
  }) {
    return _then(_$_Message(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      messageDate: freezed == messageDate
          ? _value.messageDate
          : messageDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$_Message implements _Message {
  const _$_Message(
      {@JsonKey(name: 'message') this.message = "",
      @JsonKey(name: 'attachment') this.attachment = "",
      @JsonKey(name: 'message_date') this.messageDate = null,
      @JsonKey(name: 'from_id') this.fromId = "",
      @JsonKey(name: 'to_id') this.toId = ""});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'attachment')
  final String attachment;
  @override
  @JsonKey(name: 'message_date')
  final DateTime? messageDate;
  @override
  @JsonKey(name: 'from_id')
  final String fromId;
  @override
  @JsonKey(name: 'to_id')
  final String toId;

  @override
  String toString() {
    return 'Message(message: $message, attachment: $attachment, messageDate: $messageDate, fromId: $fromId, toId: $toId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Message &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.messageDate, messageDate) ||
                other.messageDate == messageDate) &&
            (identical(other.fromId, fromId) || other.fromId == fromId) &&
            (identical(other.toId, toId) || other.toId == toId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, attachment, messageDate, fromId, toId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      __$$_MessageCopyWithImpl<_$_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {@JsonKey(name: 'message') final String message,
      @JsonKey(name: 'attachment') final String attachment,
      @JsonKey(name: 'message_date') final DateTime? messageDate,
      @JsonKey(name: 'from_id') final String fromId,
      @JsonKey(name: 'to_id') final String toId}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'attachment')
  String get attachment;
  @override
  @JsonKey(name: 'message_date')
  DateTime? get messageDate;
  @override
  @JsonKey(name: 'from_id')
  String get fromId;
  @override
  @JsonKey(name: 'to_id')
  String get toId;
  @override
  @JsonKey(ignore: true)
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
