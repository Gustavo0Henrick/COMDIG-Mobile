part of '../cubits/get_recommended_cubit.dart';

abstract class GetRecommendedStates extends Equatable {}

class GetRecommendedInitialState extends GetRecommendedStates {
  @override
  List<Object?> get props => [];
}

class GetRecommendedLoadingState extends GetRecommendedStates {
  @override
  List<Object?> get props => [];
}

class GetRecommendedSuccessState extends GetRecommendedStates {
  final List<CompanyItemEntity> result;

  GetRecommendedSuccessState({required this.result});

  @override
  List<List<CompanyItemEntity>> get props => [result];
}

class GetRecommendedErrorState extends GetRecommendedStates {
  final Failure failure;

  GetRecommendedErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
