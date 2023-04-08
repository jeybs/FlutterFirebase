
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@Freezed()
class Message with _$Message {

  const factory Message({
    @JsonKey(name: 'message') @Default("") String message,
    @JsonKey(name: 'message_date') @Default(null) DateTime? messageDate,
    @JsonKey(name: 'from_id') @Default("") String fromId,
    @JsonKey(name: 'to_id') @Default("") String toId,
  }) = _Message;

  factory Message.fromJson(Map<String, Object?> json) => _$MessageFromJson(json);

}