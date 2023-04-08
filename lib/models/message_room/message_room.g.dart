// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageRoom _$$_MessageRoomFromJson(Map<String, dynamic> json) =>
    _$_MessageRoom(
      userData: json['userData'] == null
          ? null
          : UserData.fromJson(json['userData'] as Map<String, dynamic>),
      lastMessage: json['last_message'] as String? ?? "",
      lastMessageDate: json['last_message_date'] as String? ?? "",
      fromId: json['from_id'] as String? ?? "",
      toId: json['to_id'] as String? ?? "",
      roomId: json['room_id'] as String? ?? "",
      receiverRoomId: json['sender_room_id'] as String? ?? "",
    );

Map<String, dynamic> _$$_MessageRoomToJson(_$_MessageRoom instance) =>
    <String, dynamic>{
      'userData': instance.userData,
      'last_message': instance.lastMessage,
      'last_message_date': instance.lastMessageDate,
      'from_id': instance.fromId,
      'to_id': instance.toId,
      'room_id': instance.roomId,
      'sender_room_id': instance.receiverRoomId,
    };
