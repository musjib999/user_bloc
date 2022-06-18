part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUsers extends UserEvent {}

class GetSingleUser extends UserEvent {
  final UserModel user;
  const GetSingleUser(this.user);

  @override
  List<Object> get props => [];
}

class AddFavouriteUser extends UserEvent {
  final UserModel user;
  const AddFavouriteUser(this.user);

  @override
  List<Object> get props => [user];
}

class RemoveFavouriteUser extends UserEvent {
  final UserModel user;
  const RemoveFavouriteUser(this.user);

  @override
  List<Object> get props => [user];
}
