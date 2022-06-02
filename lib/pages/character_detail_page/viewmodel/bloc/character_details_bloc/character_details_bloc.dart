import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_marvel_app/pages/character_detail_page/model/character_comics_model.dart';
import 'package:path_marvel_app/pages/character_detail_page/model/character_details_model.dart';
import 'package:path_marvel_app/pages/character_detail_page/service/character_detail_service.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  bool isLoading = false;
  CharacterDetailsBloc() : super(CharacterDetailsInitialState());
  @override
  Stream<CharacterDetailsState> mapEventToState(
    CharacterDetailsEvent event,
  ) async* {
    if (event is GetCharacterDetailsEvent) {
      yield CharacterDetailsLoadingState();
      final characterDetails =
          await CharacterDetailsService.getCharacterDetails(
        id: event.id,
      );
      final characterComics = await CharacterDetailsService.getCharacterComics(
        id: event.id,
      );
      if (characterDetails is CharacterDetails &&
          characterComics is CharacterComics) {
        yield CharacterDetailsSuccessState(
          characterDetails: characterDetails,
          characterComics: characterComics,
        );
      } else {
        yield CharacterDetailsFailureState(error: characterDetails);
      }
    }
    if (event is ClearCharacterDetailsEvent) {
      yield CharacterDetailsInitialState();
    }
  }
}
