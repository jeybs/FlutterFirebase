part of 'user_info_cubit.dart';

@immutable
abstract class UserInfoState {
  const UserInfoState();
}

class UserInfoInitial extends UserInfoState {
  const UserInfoInitial();
}

class UserProfileLoaded extends UserInfoState {
  final UserData? userData;
  const UserProfileLoaded(this.userData);
}

class IsUserAreadyAdded extends UserInfoState {
  final bool isAdded;
  const IsUserAreadyAdded(this.isAdded);
}

class UserAdded extends UserInfoState {
  final bool isAdded;
  const UserAdded(this.isAdded);
}

class RoomCreated extends UserInfoState {
  final String myRoomId;
  final String receiverRoomId;
  const RoomCreated(this.myRoomId, this.receiverRoomId);
}