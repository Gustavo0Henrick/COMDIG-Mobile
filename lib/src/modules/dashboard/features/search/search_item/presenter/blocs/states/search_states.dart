part of '../cubits/search_cubit.dart';

abstract class SearchStates extends Equatable {}

class SearchInitialState extends SearchStates {
  @override
  List<Object?> get props => [];
}

class SearchLoadingState extends SearchStates {
  @override
  List<Object?> get props => [];
}

class SearchSuccessState extends SearchStates {
  final List<CompanyItemEntity> result;

  SearchSuccessState({required this.result});

  @override
  List<List<CompanyItemEntity>> get props => [result];
}

class SearchErrorState extends SearchStates {
  final Failure failure;

  SearchErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
