part of 'user_bloc.dart';

class UserState extends Equatable {

  final List<UserList> userList ;

  const UserState({required this.userList});

  UserState copyWith({List<UserList>? userList}){
    return UserState(userList: userList ?? this.userList);
  }

  @override
  List<Object> get props => [userList];
}


