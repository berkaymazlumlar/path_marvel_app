part of 'characters_bloc.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersInitialState extends CharactersState {}

class CharactersLoadingState extends CharactersState {}

class CharactersTempState extends CharactersState {}

class CharactersSuccessState extends CharactersState {
  final Characters characters;
  const CharactersSuccessState({required this.characters});

  CharactersSuccessState copyWith({Characters? characters}) {
    return CharactersSuccessState(characters: characters ?? this.characters);
  }
}

class CharactersFailureState extends CharactersState {
  final String error;

  const CharactersFailureState({required this.error});
}
