import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_bloc/bloc/user_bloc.dart';
import 'package:user_bloc/model/user_model.dart';
import 'package:user_bloc/shared/widget/intial_users.dart';
import 'package:user_bloc/view/single_user_screen.dart';

import '../shared/global/my_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: BlocProvider(
        create: (context) => userBloc,
        child: BlocBuilder(
          bloc: userBloc,
          builder: (context, UserState state) {
            if (state is UserInitial) {
              return const InitalUsers();
            } else if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AllUserLoaded) {
              List<UserModel> users = state.users;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    onTap: () {
                      final singleUser = BlocProvider.of<UserBloc>(context);
                      singleUser.add(GetSingleUser(users[index]));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return SingleUserScreen(
                            user: users[index],
                          );
                        }),
                      );
                    },
                    leading: CircleAvatar(child: Text(users[index].name[0])),
                    title: Text(
                      users[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(users[index].email),
                  );
                }),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
