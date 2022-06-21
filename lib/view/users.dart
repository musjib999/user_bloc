import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_bloc/bloc/user_bloc.dart';
import 'package:user_bloc/data/user_data.dart';
import 'package:user_bloc/model/user_model.dart';
import 'package:user_bloc/shared/widget/intial_users.dart';
import 'package:user_bloc/view/favourite_user_screen.dart';

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
        title: const Text('Users'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouriteScreen(users: favouriteUsers),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => userBloc,
        child: BlocBuilder<UserBloc, UserState>(
          bloc: userBloc,
          builder: (context, state) {
            if (state.status == UserStatus.initial) {
              return const InitalUsers();
            } else if (state.status == UserStatus.failure) {
              return const Center(
                child: Text('Failed To Fetch All Users'),
              );
            } else {
              final userStateAsUserLoaded = state;
              List<UserModel> users = userStateAsUserLoaded.users;
              return ListView.separated(
                itemCount: users.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: ((context, index) {
                  return ListTile(
                    onTap: () {
                      // final singleUser = BlocProvider.of<UserBloc>(context);
                      // singleUser.add(GetSingleUser(users[index]));
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) {
                      //     return SingleUserScreen(
                      //       user: users[index],
                      //     );
                      //   }),
                      // );
                    },
                    leading: CircleAvatar(child: Text(users[index].name[0])),
                    title: Text(
                      users[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(users[index].email),
                    trailing: IconButton(
                      onPressed: () {
                        if (!favouriteUsers.contains(users[index])) {
                          BlocProvider.of<UserBloc>(context).add(
                            AddFavouriteUser(users[index]),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${state.users[index].name} has been added'),
                            ),
                          );
                        } else {
                          BlocProvider.of<UserBloc>(context).add(
                            RemoveFavouriteUser(users[index]),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${state.users[index].name} has been removed'),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.favorite_border),
                    ),
                  );
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
