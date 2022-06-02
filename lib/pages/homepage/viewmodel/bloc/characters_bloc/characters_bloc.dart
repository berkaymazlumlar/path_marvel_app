import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_marvel_app/pages/homepage/service/homepage_service.dart';

import '../../../model/characters_model.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitialState());
  int offset = 0;
  bool hasReachedMax = false;

  @override
  Stream<CharactersState> mapEventToState(
    CharactersEvent event,
  ) async* {
    final _currentState = state;
    if (event is GetCharactersEvent) {
      if (_currentState is CharactersInitialState) {
        // if data is coming for the first time
        yield CharactersLoadingState();
        final characters = await HomepageService.getCharacters(
          offset: 0,
        );
        if (characters is Characters) {
          yield CharactersSuccessState(characters: characters);
        } else {
          yield CharactersFailureState(error: characters);
        }
      }
      if (_currentState is CharactersSuccessState && !hasReachedMax) {
        // if data came in at least once
        offset = offset + 30;
        final characters = await HomepageService.getCharacters(
          offset: offset,
        );
        if (characters is Characters) {
          yield CharactersTempState();

          if (_currentState.characters.data!.results!.length >=
              _currentState.characters.data!.total!) {
            hasReachedMax = true;
          }
          _currentState.characters.data!.results!
              .addAll(characters.data!.results!);
          // new data merged with old ones

          yield _currentState.copyWith(characters: _currentState.characters);
        }
      }
    }
    if (event is ClearCharactersEvent) {
      yield CharactersInitialState();
    }
  }
}
