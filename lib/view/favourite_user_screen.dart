import 'package:flutter/material.dart';
import 'package:user_bloc/model/user_model.dart';

class FavouriteScreen extends StatefulWidget {
  final List<UserModel> users;
  const FavouriteScreen({Key? key, required this.users}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: widget.users.isEmpty
          ? const Center(
              child: Text(
              'No Favourite User Added Yet!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ))
          : ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(widget.users[index].name[0]),
                  ),
                  title: Text(
                    widget.users[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    widget.users[index].email,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: widget.users.length,
            ),
    );
  }
}
