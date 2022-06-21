import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_bloc/core/service_injector.dart';
import 'package:user_bloc/model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState(users: [])) {
    on<GetUsers>(_onFetchUsers);
  }
  Future _onFetchUsers(event, emit) async {
    if (event is GetUsers) {
      try {
        if (state.status == UserStatus.initial) {
          final fetchedUsers = await si.userService.getAllUsers();
          return emit.call(
            state.copyWith(status: UserStatus.success, users: fetchedUsers),
          );
        }
      } catch (_) {
        return emit.call(
          state.copyWith(
            status: UserStatus.failure,
            users: [],
          ),
        );
      }
    }
  }
}




// Future _onFetchUsers(event, emit) async {
//   if (event is GetUsers) {
//     if (state.status == UserStatus.initial) {}
//   } else if (event is GetSingleUser) {
//     emit.call(UserLoading());
//     UserModel user =
//         await si.userService.getSingleUser(event.user.id) as UserModel;
//     emit.call(SingleUserLoaded(user: user));
//   } else if (event is AddFavouriteUser) {
//     favouriteUsers.add(event.user);
//     emit.call(FavouriteUserAdded(favouriteUsers));
//   } else if (event is RemoveFavouriteUser) {
//     favouriteUsers.remove(event.user);
//     emit.call(FavouriteUserRemoved(favouriteUsers));
//   }
// }