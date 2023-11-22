import 'package:dio/dio.dart';

import 'package:movie/data/models/movis_model.dart';
import 'package:movie/data/remote/api_endpoints.dart';
import 'package:movie/data/remote/dio_helper.dart';
import 'package:movie/repositorys/movies_repository/movies_repository.dart';
import 'package:movie/utils/constants.dart';

class MoviesApi extends MoviesRepository {
  @override
  Future<MoviesModel> getAllMovies() async {

    MoviesModel ?movie ;

    try {
      Response response = await    DioHelper.getData( url: ApiEndpoints.popularMovies ,query: {



        "api_key" : AppConstants.apiKey,

        "language" :AppConstants.apiDataLang,
      });


 movie = MoviesModel.fromJson(response.data);
      return movie ;


        // (response.data as List)
        //   .map((x) => MoviesModel.fromJson(x))
        //   .toList();
    } catch (error) {


      throw Exception("Exception : $error ");
    }



  }

  @override
  Future<void> cacheMovies({ required MoviesModel movies, }) {
    // TODO: implement cacheMovies
    throw UnimplementedError();
  }








}