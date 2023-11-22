import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie/data/models/movis_model.dart';

import 'package:movie/repositorys/movies_repository/movies_api.dart';
import 'package:movie/repositorys/movies_repository/movies_local.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  static MovieCubit get(context) => BlocProvider.of(context);

  // reference

  InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 2),
    checkInterval: const Duration(seconds: 2),
  );

  MoviesApi moviesApi = MoviesApi();

  MoviesLocal moviesLocal = MoviesLocal();

  MoviesModel? movies;

  // methods

  getMoviesData() async {
    emit(LoadingGetMoviesState());
    try {
      if (await internetConnectionChecker.hasConnection) {
        movies = await moviesApi.getAllMovies();

        await moviesLocal.cacheMovies(
          movies: movies!,
        );
      } else {
        movies = await moviesLocal.getAllMovies();
      }

      emit(SuccessGetGetMoviesState());
    } catch (e) {
      debugPrint(e.toString());

      emit(ErrorGetGetMoviesState());
      rethrow;
    }
  }
}
