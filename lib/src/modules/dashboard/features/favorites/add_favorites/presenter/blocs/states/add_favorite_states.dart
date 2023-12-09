part of '../cubits/add_favorite_cubit.dart';

abstract class AddFavoriteStates extends Equatable {}

class AddFavoriteInitialState extends AddFavoriteStates {
  @override
  List<Object?> get props => [];
}

class AddFavoriteLoadingState extends AddFavoriteStates {
  @override
  List<Object?> get props => [];
}

class AddFavoriteSuccessState extends AddFavoriteStates {
  final dynamic result;

  AddFavoriteSuccessState({required this.result});

  @override
  List<dynamic> get props => [result];
}

class AddFavoriteErrorState extends AddFavoriteStates {
  final Failure failure;

  AddFavoriteErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
