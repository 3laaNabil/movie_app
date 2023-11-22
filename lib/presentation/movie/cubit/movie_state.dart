part of 'movie_cubit.dart';


abstract class MovieState {}

class MovieInitial extends MovieState {}
class LoadingGetMoviesState extends MovieState {}

class SuccessGetGetMoviesState extends MovieState {}

class ErrorGetGetMoviesState extends MovieState {}