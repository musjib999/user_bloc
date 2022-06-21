part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, failure }

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.initial,
    required this.users,
  });
  final UserStatus status;
  final List<UserModel> users;

  UserState copyWith({
    UserStatus? status,
    List<UserModel>? users,
  }) {
    return UserState(
      status: status ?? this.status,
      users: this.users,
    );
  }

  @override
  List<Object> get props => [status];
}

// class UserInitial extends UserState {}

// class UserLoading extends UserState {}

// class AllUserLoaded extends UserState {
//   final List<UserModel> users;
//   const AllUserLoaded({required this.users});

//   @override
//   List<Object> get props => [users];
// }

// class SingleUserLoaded extends UserState {
//   final UserModel user;
//   const SingleUserLoaded({required this.user});

//   @override
//   List<Object> get props => [user];
// }

// class FavouriteUserAdded extends UserState {
//   final List<UserModel> users;
//   const FavouriteUserAdded(this.users);

//   @override
//   List<Object> get props => [users];
// }

// class FavouriteUserRemoved extends UserState {
//   final List<UserModel> users;
//   const FavouriteUserRemoved(this.users);

//   @override
//   List<Object> get props => [users];
// }
