part of '../cubits/post_review_cubit.dart';

abstract class PostReviewStates extends Equatable {}

class PostReviewInitialState extends PostReviewStates {
  @override
  List<Object?> get props => [];
}

class PostReviewLoadingState extends PostReviewStates {
  @override
  List<Object?> get props => [];
}

class PostReviewSuccessState extends PostReviewStates {
  final dynamic result;

  PostReviewSuccessState({required this.result});

  @override
  List<dynamic> get props => [result];
}

class PostReviewErrorState extends PostReviewStates {
  final Failure failure;

  PostReviewErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
