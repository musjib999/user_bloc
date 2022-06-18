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
    return Container();
  }
}
