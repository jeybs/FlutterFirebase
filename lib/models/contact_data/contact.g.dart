// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
      userData: json['userData'] == null
          ? null
          : UserData.fromJson(json['userData'] as Map<String, dynamic>),
      lastMessage: json['last_message'] as String? ?? "",
      lastMessageDate: json['last_message_date'] as String? ?? "",
      fromId: json['from_id'] as String? ?? "",
      toId: json['to_id'] as String? ?? "",
    );

Map<String, dynamic> _$$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'userData': instance.userData,
      'last_message': instance.lastMessage,
      'last_message_date': instance.lastMessageDate,
      'from_id': instance.fromId,
      'to_id': instance.toId,
    };
