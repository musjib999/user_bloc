import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_bloc/bloc/user_bloc.dart';

class InitalUsers extends StatefulWidget {
  const InitalUsers({Key? key}) : super(key: key);

  @override
  State<InitalUsers> createState() => _InitalUsersState();
}

class _InitalUsersState extends State<InitalUsers> {
  @override
  void initState() {
    super.initState();
    final userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(GetUsers());
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text('Initial State'),
      //     const SizedBox(height: 12),
      //     MaterialButton(
      //       onPressed: () {
      //         final userBloc = BlocProvider.of<UserBloc>(context);
      //         userBloc.add(GetUsers());
      //       },
      //       color: Colors.blue,
      //       child: const Text(
      //         'Get Users',
      //         style: TextStyle(color: Colors.white),
      //       ),
      //     ),
      //   ],
      // ),
      child: CircularProgressIndicator(),
    );
  }
}
