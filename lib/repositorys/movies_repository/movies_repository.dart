import 'package:movie/data/models/movis_model.dart';

abstract class MoviesRepository {

  // get data
  Future<MoviesModel> getAllMovies();


  // save data in local DB
  Future<void> cacheMovies({
    required MoviesModel movies,
  });
}
