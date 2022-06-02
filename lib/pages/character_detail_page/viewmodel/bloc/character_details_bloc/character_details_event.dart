part of 'character_details_bloc.dart';

abstract class CharacterDetailsEvent extends Equatable {
  const CharacterDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetCharacterDetailsEvent extends CharacterDetailsEvent {
  final String id;
  const GetCharacterDetailsEvent({
    required this.id,
  });
}

class ClearCharacterDetailsEvent extends CharacterDetailsEvent {}
