import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import 'movies_body.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: CustomAppBar(),
      ),
      body: MoviesBody(),
    ));
  }
}
