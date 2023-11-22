import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/movie/cubit/movie_cubit.dart';

import '../widgets/movie_card.dart';

class MoviesBody extends StatelessWidget {
  const MoviesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        final cubit = MovieCubit.get(context);
        return state is SuccessGetGetMoviesState
            ? GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(
                    cubit.movies!.results!.length,
                    (index) => MovieCard(
                          imgUrl:
                              '${cubit.movies!.results![index].posterPath}',
                          rate: cubit.movies!.results![index].voteCount!
                              .toDouble(),
                          id: cubit.movies!.results![index].id!,
                        )),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
