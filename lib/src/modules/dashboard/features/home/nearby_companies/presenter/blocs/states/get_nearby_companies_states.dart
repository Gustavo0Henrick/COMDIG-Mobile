part of '../cubits/get_nearby_companies_cubit.dart';

abstract class GetNearbyCompaniesStates extends Equatable {}

class GetNearbyCompaniesInitialState extends GetNearbyCompaniesStates {
  @override
  List<Object?> get props => [];
}

class GetNearbyCompaniesLoadingState extends GetNearbyCompaniesStates {
  @override
  List<Object?> get props => [];
}

class GetNearbyCompaniesSuccessState extends GetNearbyCompaniesStates {
  final List<CompanyItemEntity> result;

  GetNearbyCompaniesSuccessState({required this.result});

  @override
  List<List<CompanyItemEntity>> get props => [result];
}

class GetNearbyCompaniesErrorState extends GetNearbyCompaniesStates {
  final Failure failure;

  GetNearbyCompaniesErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
