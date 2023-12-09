part of '../cubits/get_my_profile_cubit.dart';

abstract class GetMyProfileStates extends Equatable {}

class GetMyProfileInitialState extends GetMyProfileStates {
  @override
  List<Object?> get props => [];
}

class GetMyProfileLoadingState extends GetMyProfileStates {
  @override
  List<Object?> get props => [];
}

class GetMyProfileSuccessState extends GetMyProfileStates {
  final MyProfileEntity myProfile;

  GetMyProfileSuccessState({required this.myProfile});

  @override
  List<MyProfileEntity> get props => [myProfile];
}

class GetMyProfileErrorState extends GetMyProfileStates {
  final Failure failure;

  GetMyProfileErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
