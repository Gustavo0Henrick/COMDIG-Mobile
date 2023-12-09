part of '../cubits/get_reviews_cubit.dart';


abstract class GetReviewsStates extends Equatable {}

class GetReviewsInitialState extends GetReviewsStates {
  @override
  List<Object?> get props => [];
}

class GetReviewsLoadingState extends GetReviewsStates {
  @override
  List<Object?> get props => [];
}

class GetReviewsSuccessState extends GetReviewsStates {
  final ReviewsInfoEntity result;

  GetReviewsSuccessState({required this.result});

  @override
  List<ReviewsInfoEntity> get props => [result];
}

class GetReviewsErrorState extends GetReviewsStates {
  final Failure failure;

  GetReviewsErrorState({required this.failure});

  @override
  List<Failure> get props => [failure];
}
