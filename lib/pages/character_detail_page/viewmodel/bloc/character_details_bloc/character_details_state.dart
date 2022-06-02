part of 'character_details_bloc.dart';

abstract class CharacterDetailsState extends Equatable {
  const CharacterDetailsState();

  @override
  List<Object> get props => [];
}

class CharacterDetailsInitialState extends CharacterDetailsState {}

class CharacterDetailsLoadingState extends CharacterDetailsState {}

class CharacterDetailsTempState extends CharacterDetailsState {}

class CharacterDetailsSuccessState extends CharacterDetailsState {
  final CharacterDetails characterDetails;
  final CharacterComics characterComics;
  const CharacterDetailsSuccessState(
      {required this.characterDetails, required this.characterComics});
}

class CharacterDetailsFailureState extends CharacterDetailsState {
  final String error;

  const CharacterDetailsFailureState({required this.error});
}
