
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_room.freezed.dart';
part 'message_room.g.dart';

@Freezed()
class MessageRoom with _$MessageRoom {

  const factory MessageRoom({
    @Default(null) UserData? userData,
    @JsonKey(name: 'last_message') @Default("") String lastMessage,
    @JsonKey(name: 'last_message_date') @Default("") String lastMessageDate,
    @JsonKey(name: 'from_id') @Default("") String fromId,
    @JsonKey(name: 'to_id') @Default("") String toId,
    @JsonKey(name: 'room_id') @Default("") String roomId,
  @JsonKey(name: 'sender_room_id') @Default("") String receiverRoomId
  }) = _MessageRoom;

  factory MessageRoom.fromJson(Map<String, Object?> json) => _$MessageRoomFromJson(json);
}