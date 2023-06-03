import 'package:flutter/material.dart';
import 'package:test_swift_dynamics_app/src/bloc/user_bloc/user_bloc.dart';
import 'package:test_swift_dynamics_app/src/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


final userBloc = BlocProvider<UserBloc>(create: (context) => UserBloc());


main(){
  runApp(
    MultiBlocProvider(
      providers: [userBloc],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    )
  );
}