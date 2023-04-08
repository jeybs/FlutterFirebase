// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageRoom _$MessageRoomFromJson(Map<String, dynamic> json) {
  return _MessageRoom.fromJson(json);
}

/// @nodoc
mixin _$MessageRoom {
  UserData? get userData => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message')
  String get lastMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message_date')
  String get lastMessageDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'attachment')
  String get attachment => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_id')
  String get fromId => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_id')
  String get toId => throw _privateConstructorUsedError;
  @JsonKey(name: 'room_id')
  String get roomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_room_id')
  String get receiverRoomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  bool get isRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageRoomCopyWith<MessageRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageRoomCopyWith<$Res> {
  factory $MessageRoomCopyWith(
          MessageRoom value, $Res Function(MessageRoom) then) =
      _$MessageRoomCopyWithImpl<$Res, MessageRoom>;
  @useResult
  $Res call(
      {UserData? userData,
      @JsonKey(name: 'last_message') String lastMessage,
      @JsonKey(name: 'last_message_date') String lastMessageDate,
      @JsonKey(name: 'attachment') String attachment,
      @JsonKey(name: 'from_id') String fromId,
      @JsonKey(name: 'to_id') String toId,
      @JsonKey(name: 'room_id') String roomId,
      @JsonKey(name: 'sender_room_id') String receiverRoomId,
      @JsonKey(name: 'is_read') bool isRead});

  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$MessageRoomCopyWithImpl<$Res, $Val extends MessageRoom>
    implements $MessageRoomCopyWith<$Res> {
  _$MessageRoomCopyWithImpl(this._value, this._then);

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
    Object? attachment = null,
    Object? fromId = null,
    Object? toId = null,
    Object? roomId = null,
    Object? receiverRoomId = null,
    Object? isRead = null,
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
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      fromId: null == fromId
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as String,
      toId: null == toId
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverRoomId: null == receiverRoomId
          ? _value.receiverRoomId
          : receiverRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_MessageRoomCopyWith<$Res>
    implements $MessageRoomCopyWith<$Res> {
  factory _$$_MessageRoomCopyWith(
          _$_MessageRoom value, $Res Function(_$_MessageRoom) then) =
      __$$_MessageRoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserData? userData,
      @JsonKey(name: 'last_message') String lastMessage,
      @JsonKey(name: 'last_message_date') String lastMessageDate,
      @JsonKey(name: 'attachment') String attachment,
      @JsonKey(name: 'from_id') String fromId,
      @JsonKey(name: 'to_id') String toId,
      @JsonKey(name: 'room_id') String roomId,
      @JsonKey(name: 'sender_room_id') String receiverRoomId,
      @JsonKey(name: 'is_read') bool isRead});

  @override
  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$_MessageRoomCopyWithImpl<$Res>
    extends _$MessageRoomCopyWithImpl<$Res, _$_MessageRoom>
    implements _$$_MessageRoomCopyWith<$Res> {
  __$$_MessageRoomCopyWithImpl(
      _$_MessageRoom _value, $Res Function(_$_MessageRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = freezed,
    Object? lastMessage = null,
    Object? lastMessageDate = null,
    Object? attachment = null,
    Object? fromId = null,
    Object? toId = null,
    Object? roomId = null,
    Object? receiverRoomId = null,
    Object? isRead = null,
  }) {
    return _then(_$_MessageRoom(
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
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      fromId: null == fromId
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as String,
      toId: null == toId
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverRoomId: null == receiverRoomId
          ? _value.receiverRoomId
          : receiverRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageRoom implements _MessageRoom {
  const _$_MessageRoom(
      {this.userData = null,
      @JsonKey(name: 'last_message') this.lastMessage = "",
      @JsonKey(name: 'last_message_date') this.lastMessageDate = "",
      @JsonKey(name: 'attachment') this.attachment = "",
      @JsonKey(name: 'from_id') this.fromId = "",
      @JsonKey(name: 'to_id') this.toId = "",
      @JsonKey(name: 'room_id') this.roomId = "",
      @JsonKey(name: 'sender_room_id') this.receiverRoomId = "",
      @JsonKey(name: 'is_read') this.isRead = false});

  factory _$_MessageRoom.fromJson(Map<String, dynamic> json) =>
      _$$_MessageRoomFromJson(json);

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
  @JsonKey(name: 'attachment')
  final String attachment;
  @override
  @JsonKey(name: 'from_id')
  final String fromId;
  @override
  @JsonKey(name: 'to_id')
  final String toId;
  @override
  @JsonKey(name: 'room_id')
  final String roomId;
  @override
  @JsonKey(name: 'sender_room_id')
  final String receiverRoomId;
  @override
  @JsonKey(name: 'is_read')
  final bool isRead;

  @override
  String toString() {
    return 'MessageRoom(userData: $userData, lastMessage: $lastMessage, lastMessageDate: $lastMessageDate, attachment: $attachment, fromId: $fromId, toId: $toId, roomId: $roomId, receiverRoomId: $receiverRoomId, isRead: $isRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageRoom &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageDate, lastMessageDate) ||
                other.lastMessageDate == lastMessageDate) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.fromId, fromId) || other.fromId == fromId) &&
            (identical(other.toId, toId) || other.toId == toId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.receiverRoomId, receiverRoomId) ||
                other.receiverRoomId == receiverRoomId) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userData,
      lastMessage,
      lastMessageDate,
      attachment,
      fromId,
      toId,
      roomId,
      receiverRoomId,
      isRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageRoomCopyWith<_$_MessageRoom> get copyWith =>
      __$$_MessageRoomCopyWithImpl<_$_MessageRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageRoomToJson(
      this,
    );
  }
}

abstract class _MessageRoom implements MessageRoom {
  const factory _MessageRoom(
      {final UserData? userData,
      @JsonKey(name: 'last_message') final String lastMessage,
      @JsonKey(name: 'last_message_date') final String lastMessageDate,
      @JsonKey(name: 'attachment') final String attachment,
      @JsonKey(name: 'from_id') final String fromId,
      @JsonKey(name: 'to_id') final String toId,
      @JsonKey(name: 'room_id') final String roomId,
      @JsonKey(name: 'sender_room_id') final String receiverRoomId,
      @JsonKey(name: 'is_read') final bool isRead}) = _$_MessageRoom;

  factory _MessageRoom.fromJson(Map<String, dynamic> json) =
      _$_MessageRoom.fromJson;

  @override
  UserData? get userData;
  @override
  @JsonKey(name: 'last_message')
  String get lastMessage;
  @override
  @JsonKey(name: 'last_message_date')
  String get lastMessageDate;
  @override
  @JsonKey(name: 'attachment')
  String get attachment;
  @override
  @JsonKey(name: 'from_id')
  String get fromId;
  @override
  @JsonKey(name: 'to_id')
  String get toId;
  @override
  @JsonKey(name: 'room_id')
  String get roomId;
  @override
  @JsonKey(name: 'sender_room_id')
  String get receiverRoomId;
  @override
  @JsonKey(name: 'is_read')
  bool get isRead;
  @override
  @JsonKey(ignore: true)
  _$$_MessageRoomCopyWith<_$_MessageRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
