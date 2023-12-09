part of '../cubits/get_my_self_cubit.dart';


abstract class GetMySelfStates extends Equatable {}

class GetMySelfInitialState extends GetMySelfStates {
  @override
  List<Object?> get props => [];
}

class GetMySelfLoadingState extends GetMySelfStates {
  @override
  List<Object?> get props => [];
}

class GetMySelfSuccessState extends GetMySelfStates {
  final UserEntity userEntity;

  GetMySelfSuccessState({required this.userEntity});

  @override
  List<UserEntity> get props => [userEntity];
}

class GetMySelfErrorState extends GetMySelfStates {
  final Failure failure;

  GetMySelfErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
