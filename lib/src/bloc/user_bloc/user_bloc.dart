
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/userlist.dart';

part 'user_event.dart';

part 'user_state.dart';

List<UserList> userList = [
  UserList(
    fullName: "Apisit Kulkham",
    email: "turtleapisit@gmail.com",
    numPhone: "0628268567",
    hNum: "158",
    county: "Bangkhae",
    district: "Bangphai",
    province: "Bangkok",
    postCode: "10160",
  ),
  UserList(
    fullName: "Surasak Meesang",
    email: "Surasak@gmail.com",
    numPhone: "08164783094",
    hNum: "365",
    county: "muang",
    district: "Kailast",
    province: "Ubon",
    postCode: "20864",
  ),
  UserList(
    fullName: "Supachai Jaidee",
    email: "Supachai@gmail.com",
    numPhone: "0914567849",
    hNum: "98",
    county: "Bangbon",
    district: "Bangbon",
    province: "Bangkok",
    postCode: "10180",
  ),
];



class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(userList: userList)) {



    //Create Event

    on<UserEventCreate>((event, emit) {

      final UserList newUser = UserList(
        fullName: event.user.fullName,
        email: event.user.email,
        numPhone: event.user.numPhone,
        hNum: event.user.hNum,
        county: event.user.county,
        district: event.user.district,
        province: event.user.province,
        postCode: event.user.postCode,
      );

      final List<UserList> updatedList = [...state.userList, newUser];

      emit(state.copyWith(userList: updatedList));
    });








    //Delete Event
    on<UserEventDelete>((event, emit) {
      final UserEventDelete deleteEvent = event as UserEventDelete;
      final UserList userToDelete = deleteEvent.user;

      final List<UserList> updatedUserList = List.from(state.userList);
      updatedUserList.remove(userToDelete);

      emit(state.copyWith(userList: updatedUserList));
    });
  }
}
