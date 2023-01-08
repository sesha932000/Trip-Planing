import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/app_cubit_logics.dart';
import 'package:project/cubit/app_cubits.dart';
import 'package:project/pages/details_page.dart';
import 'package:project/pages/navpages/main_page.dart';
import 'package:project/pages/welcome_page.dart';
import 'package:project/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:BlocProvider<AppCubits>(create:(context)=>AppCubits(
        data: DataServices()
      ),
      child: AppCubitLogics(),
      )
    );
  }
}
