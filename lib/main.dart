import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie/presentation/movie/cubit/movie_cubit.dart';
import 'package:movie/presentation/movie/screens/movies_screen.dart';
import 'package:movie/utils/constants.dart';

import 'data/remote/dio_helper.dart';

Future<void> main() async {

 WidgetsFlutterBinding.ensureInitialized();

await  DioHelper.init();
  await Hive.initFlutter();

  await Hive.openBox(AppConstants.hiveBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MovieCubit()..getMoviesData(),
        child: const MoviesScreen(),
      ),
    );
  }
}

