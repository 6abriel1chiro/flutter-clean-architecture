import 'package:flutter/material.dart';
import 'package:flutter_application_clean/application/user/user_bloc.dart';
import 'package:flutter_application_clean/application/user/user_page.dart';
import 'package:flutter_application_clean/data/data-provider/data_provider.dart';
import 'package:flutter_application_clean/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => UserBloc(
              userRepository: UserRepository(dataProvider: DataProvider())),
          child: const UserPage(),
        ));
  }
}
