import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi/cubit/my_cubit.dart';
import 'package:restapi/cubit/my_state.dart';
import 'package:restapi/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];
  User? user;
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<AppCubit>(context).emitGetAllUsers();
    // BlocProvider.of<AppCubit>(context).emitGetUserDetails('3766');

    // BlocProvider.of<AppCubit>(context).emitCreateNewUser(
    //   User(
    //     name: 'ahmed',
    //     email: 'ahmflljrb3456rhg6@gmail.com',
    //     gender: 'male',
    //     status: 'inactive',
    //   ),
    // );

    BlocProvider.of<AppCubit>(context).emitDeleteUser('5767408');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home Screen'),
      ),
      body: Column(
        children: [
          // BlocBuilder<AppCubit, AppStates>(
          //   builder: (context, state) {
          //     if (state is GetAllUsers) {
          //       usersList = (state).allUsersLiset;
          //       return ListView.builder(
          //         shrinkWrap: true,
          //         padding: const EdgeInsets.all(8),
          //         itemCount: usersList.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Container(
          //             height: 50,
          //             color: Colors.cyan[100],
          //             child: Center(
          //                 child: Column(
          //               children: [
          //                 Text(usersList[index].name.toString()),
          //                 Text(usersList[index].email.toString()),
          //               ],
          //             )),
          //           );
          //         },
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )
          // BlocBuilder<AppCubit, AppStates>(
          //   builder: (context, state) {
          //     if (state is GreateNewUser) {
          //       user = (state).newUser;
          //       return Container(
          //         height: 50,
          //         color: Colors.cyan[100],
          //         child: Center(
          //             child: Column(
          //           children: [
          //             Text(user!.email.toString()),
          //           ],
          //         )),
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )
          BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              if (state is DeleteUser) {
                // user = (state).newUser;
                return Container(
                  height: 50,
                  color: Colors.cyan[100],
                  child: Center(
                      child: Column(
                    children: [
                      Text((state).date.toString()),
                    ],
                  )),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
