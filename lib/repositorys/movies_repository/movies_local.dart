import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:movie/data/models/movis_model.dart';
import 'package:movie/repositorys/movies_repository/movies_repository.dart';
import 'package:movie/utils/constants.dart';

class MoviesLocal extends MoviesRepository {



  @override
  Future<void> cacheMovies({ required MoviesModel movies}) async {
    final moviesBox = await Hive.openBox(AppConstants.hiveBox);
    return moviesBox.put(
        AppConstants.key,
        json.encode(movies));
  }


  @override
  Future<MoviesModel> getAllMovies() async {
    final movieBox = await Hive.openBox(AppConstants.hiveBox);
    final cachedMovies = movieBox.get(AppConstants.key);


    return  MoviesModel.fromJson( json
        .decode(cachedMovies));


}
  }




