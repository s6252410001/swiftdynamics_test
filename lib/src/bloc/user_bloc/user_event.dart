part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserEventCreate extends UserEvent {
  final UserList user;

  UserEventCreate({required this.user});

  @override
  List<Object?> get props => [user];
}



class UserEventDelete extends UserEvent {
  final UserList user;

  const UserEventDelete({required this.user});

  @override
  List<Object> get props => [user];
}
