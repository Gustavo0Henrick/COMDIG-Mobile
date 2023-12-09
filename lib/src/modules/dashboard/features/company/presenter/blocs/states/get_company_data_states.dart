part of '../cubits/get_company_data_cubit.dart';

abstract class GetCompanyDataStates extends Equatable {}

class GetCompanyDataInitialState extends GetCompanyDataStates {
  @override
  List<Object?> get props => [];
}

class GetCompanyDataLoadingState extends GetCompanyDataStates {
  @override
  List<Object?> get props => [];
}

class GetCompanyDataSuccessState extends GetCompanyDataStates {
  final dynamic result;

  GetCompanyDataSuccessState({required this.result});

  @override
  List<dynamic> get props => [result];
}

class GetCompanyDataErrorState extends GetCompanyDataStates {
  final Failure failure;

  GetCompanyDataErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
