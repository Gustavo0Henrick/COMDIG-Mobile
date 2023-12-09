part of '../cubits/get_featured_companies_cubit.dart';

abstract class GetFeaturedCompaniesStates extends Equatable {}

class GetFeaturedCompaniesInitialState extends GetFeaturedCompaniesStates {
  @override
  List<Object?> get props => [];
}

class GetFeaturedCompaniesLoadingState extends GetFeaturedCompaniesStates {
  @override
  List<Object?> get props => [];
}

class GetFeaturedCompaniesSuccessState extends GetFeaturedCompaniesStates {
  final List<CompanyItemEntity> result;

  GetFeaturedCompaniesSuccessState({required this.result});

  @override
  List<List<CompanyItemEntity>> get props => [result];
}

class GetFeaturedCompaniesErrorState extends GetFeaturedCompaniesStates {
  final Failure failure;

  GetFeaturedCompaniesErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
