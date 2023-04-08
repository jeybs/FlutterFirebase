part of 'chat_cubit.dart';

@immutable
abstract class ChatState {
  const ChatState();
}

class ChatInitial extends ChatState {
  const ChatInitial();
}

class UserProfileLoaded extends ChatState {
  final UserData? userData;
  const UserProfileLoaded(this.userData);
}

class MessageLoaded extends ChatState {
  final List<Message> messageList;
  const MessageLoaded(this.messageList);
}

class NewMessageUpdate extends ChatState {
  final List<Message> messageList;
  const NewMessageUpdate(this.messageList);
}

class MessageSent extends ChatState {
  const MessageSent();
}