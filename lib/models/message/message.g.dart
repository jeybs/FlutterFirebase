// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      message: json['message'] as String? ?? "",
      attachment: json['attachment'] as String? ?? "",
      messageDate: json['message_date'] == null
          ? null
          : DateTime.parse(json['message_date'] as String),
      fromId: json['from_id'] as String? ?? "",
      toId: json['to_id'] as String? ?? "",
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'message': instance.message,
      'attachment': instance.attachment,
      'message_date': instance.messageDate?.toIso8601String(),
      'from_id': instance.fromId,
      'to_id': instance.toId,
    };
