import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dio/dio.dart';
import 'package:restapi/cubit/my_cubit.dart';
import 'package:restapi/home_screen.dart';
import 'package:restapi/injection.dart';

void main() async {
  initGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => getIt<AppCubit>()..emitGetAllUsers(),
        child: const HomeScreen(),
      ),
    );
  }
}
