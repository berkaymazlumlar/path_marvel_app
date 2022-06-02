import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_marvel_app/pages/character_detail_page/model/character_comics_model.dart';
import 'package:path_marvel_app/pages/character_detail_page/model/character_details_model.dart';
import '../viewmodel/bloc/character_details_bloc/character_details_bloc.dart';

class CharacterDetailsView extends StatefulWidget {
  final String id;
  const CharacterDetailsView({Key? key, required this.id}) : super(key: key);

  @override
  State<CharacterDetailsView> createState() => _CharacterDetailsViewState();
}

class _CharacterDetailsViewState extends State<CharacterDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharacterDetailsBloc>(context)
        .add(GetCharacterDetailsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
        builder: (context, state) {
          if (state is CharacterDetailsSuccessState) {
            return CustomScrollView(
              slivers: [
                MySliverAppBar(
                  size: size,
                  title: "${state.characterDetails.data!.results!.first.name}",
                  imagePath:
                      "${state.characterDetails.data!.results!.first.thumbnail!.path}/portrait_uncanny.${state.characterDetails.data!.results!.first.thumbnail!.extension}",
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      BottomView(
                        size: size,
                        characterComics: state.characterComics,
                        characterDetails: state.characterDetails,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          if (state is CharacterDetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class BottomView extends StatelessWidget {
  final CharacterDetails characterDetails;
  final CharacterComics characterComics;

  const BottomView({
    Key? key,
    required this.size,
    required this.characterDetails,
    required this.characterComics,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              characterDetails.data!.results!.first.description!.isEmpty
                  ? "No description"
                  : characterDetails.data!.results!.first.description!,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Comics",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Expanded(
              child: characterComics.data!.results!.isNotEmpty
                  ? ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: characterComics.data!.results!.length,
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemBuilder: (context, index) {
                        return Text(
                          characterComics.data!.results![index].title!,
                        );
                      },
                    )
                  : const Text("There is no comics"),
            ),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends StatelessWidget {
  final String imagePath;
  final String title;

  const MySliverAppBar({
    Key? key,
    required this.size,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      pinned: true,
      expandedHeight: size.height,
      collapsedHeight: size.height * 0.3,
      flexibleSpace: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
