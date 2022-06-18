import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_bloc/core/service_injector.dart';
import 'package:user_bloc/model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUsers) {
        emit.call(UserLoading());
        List<UserModel> users = await si.userService.getAllUsers();
        emit.call(AllUserLoaded(users: users));
      } else if (event is GetSingleUser) {
        emit.call(UserLoading());
        UserModel user =
            await si.userService.getSingleUser(event.user.id) as UserModel;
        emit.call(SingleUserLoaded(user: user));
      }
    });
  }
}
