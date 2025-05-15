import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:eco_app/src/core/api/service_locator.dart';
import 'package:eco_app/src/login/presentation/login.dart';
import 'package:eco_app/src/login/cubit/login_cubit.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  
  WidgetsFlutterBinding.ensureInitialized();
  runZoned<Future<void>>(
        () async {
      await ServiceLocator.init();

      runApp(MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rest API Demo',
      color: const Color.fromARGB(255, 14, 15, 16),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardColor: const Color(0xffDEEBEC),
        canvasColor: const Color(0xffffffff),
        primaryColor: const Color(0xff247881),
        primaryColorDark: const Color(0xffC8C7C7),
        primaryColorLight: const Color(0xffF8F7F7), 
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffBDD6D9)),
      ),
      home: BlocProvider(
        create: (_) => LoginCubit(sl.get()),
        child: Login(),
      )
    );
  }
}
