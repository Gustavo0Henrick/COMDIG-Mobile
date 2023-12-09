part of '../cubits/edit_user_profile_cubit.dart';

abstract class EditUserProfileStates extends Equatable {}

class EditUserProfileInitialState extends EditUserProfileStates {
  @override
  List<Object?> get props => [];
}

class EditUserProfileLoadingState extends EditUserProfileStates {
  @override
  List<Object?> get props => [];
}

class EditUserProfileSuccessState extends EditUserProfileStates {
  final bool result;

  EditUserProfileSuccessState({required this.result});

  @override
  List<bool> get props => [result];
}

class EditUserProfileErrorState extends EditUserProfileStates {
  final Failure failure;

  EditUserProfileErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
