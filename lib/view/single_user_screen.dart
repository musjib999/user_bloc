// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:user_bloc/bloc/user_bloc.dart';
// import 'package:user_bloc/model/user_model.dart';
// import 'package:user_bloc/shared/global/my_bloc.dart';

// class SingleUserScreen extends StatefulWidget {
//   final UserModel user;
//   const SingleUserScreen({Key? key, required this.user}) : super(key: key);

//   @override
//   State<SingleUserScreen> createState() => _SingleUserScreenState();
// }

// class _SingleUserScreenState extends State<SingleUserScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User'),
//       ),
//       backgroundColor: Colors.grey[100],
//       body: BlocBuilder(
//         bloc: userBloc,
//         builder: ((context, UserState state) {
//           if (state is UserLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is SingleUserLoaded) {
//             return Center(
//               child: Container(
//                 margin: const EdgeInsets.all(15),
//                 padding: const EdgeInsets.all(12),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                           child: Text(
//                             state.user.name[0],
//                             style: const TextStyle(fontSize: 24),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         SizedBox(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 state.user.name,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 19),
//                               ),
//                               Text(
//                                 state.user.email,
//                                 style: const TextStyle(color: Colors.grey),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.person,
//                           size: 22,
//                         ),
//                         const Text(
//                           'Username: ',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           state.user.username,
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.phone,
//                           size: 22,
//                         ),
//                         const Text(
//                           'Phone: ',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           state.user.phone,
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.location_on,
//                           size: 22,
//                         ),
//                         const Text(
//                           'Address: ',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           state.user.address.street,
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.location_city,
//                           size: 22,
//                         ),
//                         const Text(
//                           'city: ',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           state.user.address.city,
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//           return Container();
//         }),
//       ),
//     );
//   }
// }
