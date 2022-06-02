import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_marvel_app/pages/character_detail_page/viewmodel/bloc/character_details_bloc/character_details_bloc.dart';
import 'package:path_marvel_app/pages/homepage/view/home_view.dart';
import 'package:path_marvel_app/pages/homepage/viewmodel/bloc/characters_bloc/characters_bloc.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CharactersBloc(),
          ),
          BlocProvider(
            create: (context) => CharacterDetailsBloc(),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Marvel App',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
