part of '../cubits/get_categories_cubit.dart';

abstract class GetCategoriesStates extends Equatable {}

class GetCategoriesInitialState extends GetCategoriesStates {
  @override
  List<Object?> get props => [];
}

class GetCategoriesLoadingState extends GetCategoriesStates {
  @override
  List<Object?> get props => [];
}

class GetCategoriesSuccessState extends GetCategoriesStates {
  final List<CategoryItemEntity> result;

  GetCategoriesSuccessState({required this.result});

  @override
  List<List<CategoryItemEntity>> get props => [result];
}

class GetCategoriesErrorState extends GetCategoriesStates {
  final Failure failure;

  GetCategoriesErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
