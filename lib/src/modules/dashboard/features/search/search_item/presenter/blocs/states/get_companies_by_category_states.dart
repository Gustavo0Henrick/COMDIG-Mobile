part of '../cubits/get_companies_by_category_cubit.dart';

abstract class GetCompaniesByCategoryStates extends Equatable {}

class GetCompaniesByCategoryInitialState extends GetCompaniesByCategoryStates {
  @override
  List<Object?> get props => [];
}

class GetCompaniesByCategoryLoadingState extends GetCompaniesByCategoryStates {
  @override
  List<Object?> get props => [];
}

class GetCompaniesByCategorySuccessState extends GetCompaniesByCategoryStates {
  final List<CompanyItemEntity> result;

  GetCompaniesByCategorySuccessState({required this.result});

  @override
  List<List<CompanyItemEntity>> get props => [result];
}

class GetCompaniesByCategoryErrorState extends GetCompaniesByCategoryStates {
  final Failure failure;

  GetCompaniesByCategoryErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
