import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../character_detail_page/view/character_detail_view.dart';
import '../viewmodel/bloc/characters_bloc/characters_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state is CharactersSuccessState) {
              return NotificationListener<ScrollStartNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels > 0 &&
                      notification.metrics.pixels + 100 >=
                          notification.metrics.maxScrollExtent) {
                    BlocProvider.of<CharactersBloc>(context).add(
                      const GetCharactersEvent(),
                    );
                  }
                  return true;
                },
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.characters.data!.results!.length,
                        itemBuilder: ((context, index) {
                          return HomeViewListTile(
                            title:
                                "${state.characters.data!.results![index].name}",
                            imagePath:
                                "${state.characters.data!.results![index].thumbnail!.path}/portrait_medium.${state.characters.data!.results![index].thumbnail!.extension}",
                            id: state.characters.data!.results![index].id
                                .toString(),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is CharactersInitialState) {
              BlocProvider.of<CharactersBloc>(context).add(
                const GetCharactersEvent(),
              );
            }
            if (state is CharactersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CharactersFailureState) {
              return Center(
                child: Text(
                    "There is an error while getting characters: ${state.error}"),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class HomeViewListTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final String id;
  const HomeViewListTile({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CharacterDetailsView(
                  id: id,
                ),
              ));
        },
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          title: Text(
            title,
          ),
          leading: Container(
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
