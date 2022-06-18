part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class AllUserLoaded extends UserState {
  final List<UserModel> users;
  AllUserLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class SingleUserLoaded extends UserState {
  final UserModel user;
  SingleUserLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class FavouriteUserAdded extends UserState {
  final List<UserModel> users;
  FavouriteUserAdded(this.users);

  @override
  List<Object> get props => [users];
}

class FavouriteUserRemoved extends UserState {
  final List<UserModel> users;
  FavouriteUserRemoved(this.users);

  @override
  List<Object> get props => [users];
}
