part of '../cubits/get_home_ads_cubit.dart';

abstract class GetHomeAdsStates extends Equatable {}

class GetHomeAdsInitialState extends GetHomeAdsStates {
  @override
  List<Object?> get props => [];
}

class GetHomeAdsLoadingState extends GetHomeAdsStates {
  @override
  List<Object?> get props => [];
}

class GetHomeAdsSuccessState extends GetHomeAdsStates {
  final List<HomeAdEntity> result;

  GetHomeAdsSuccessState({required this.result});

  @override
  List<List<HomeAdEntity>> get props => [result];
}

class GetHomeAdsErrorState extends GetHomeAdsStates {
  final Failure failure;

  GetHomeAdsErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
