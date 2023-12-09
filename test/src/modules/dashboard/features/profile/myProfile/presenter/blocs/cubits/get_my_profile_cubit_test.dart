import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/entities/my_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/usecases/get_my_profile_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/presenter/blocs/cubits/get_my_profile_cubit.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class GetMyProfileCubitMock extends Mock implements GetMyProfileCubit {}

class GetMyProfileUsecaseMock extends Mock implements GetMyProfileUsecase {}

void main() {
  late GetMyProfileCubit cubit;
  late GetMyProfileUsecase usecase;

  setUp(() {
    usecase = GetMyProfileUsecaseMock();
    cubit = GetMyProfileCubit(usecase: usecase);
  });

  String userId = "userId";

  MyProfileEntity myProfile = const MyProfileEntity(
    id: "id",
    name: "name",
    lastname: "lastname",
    email: "email",
    birthDate: "birthDate",
    cellphone: "cellphone",
    city: "city",
    uf: "UF",
    createdAt: "createdAt",
    updatedAt: "updatedAt",
  );

  blocTest<GetMyProfileCubit, GetMyProfileStates>(
    'When attempt to Get MyProfile for a User is made then GetMyProfileLoadingState and GetMyProfileSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => usecase(userId))
          .thenAnswer((_) async => Right<Failure, MyProfileEntity>(myProfile));
    },
    act: (GetMyProfileCubit cubit) => cubit.getMyProfile(userId),
    expect: () => [
      GetMyProfileLoadingState(),
      GetMyProfileSuccessState(myProfile: myProfile),
    ],
  );

  blocTest<GetMyProfileCubit, GetMyProfileStates>(
    'Should emitted GetMyProfileLoadingState and GetMyProfileErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userId)).thenAnswer(
        (_) async => Left<Failure, MyProfileEntity>(GeneralFailure("failure"))),
    act: (GetMyProfileCubit cubit) => cubit.getMyProfile(userId),
    expect: () => [
      GetMyProfileLoadingState(),
      GetMyProfileErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<GetMyProfileCubit, GetMyProfileStates>(
    'Should emitted GetMyProfileLoadingState and GetMyProfileErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userId)).thenAnswer((_) async =>
        Left<Failure, MyProfileEntity>(ServerFailure("server failure"))),
    act: (GetMyProfileCubit cubit) => cubit.getMyProfile(userId),
    expect: () => [
      GetMyProfileLoadingState(),
      GetMyProfileErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<GetMyProfileCubit, GetMyProfileStates>(
    'Should emitted GetMyProfileLoadingState and GetMyProfileErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userId)).thenAnswer((_) async =>
        Left<Failure, MyProfileEntity>(
            BadRequestFailure("BadRequest failure"))),
    act: (GetMyProfileCubit cubit) => cubit.getMyProfile(userId),
    expect: () => [
      GetMyProfileLoadingState(),
      GetMyProfileErrorState(failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<GetMyProfileCubit, GetMyProfileStates>(
    'Should emitted GetMyProfileLoadingState and GetMyProfileErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userId)).thenAnswer((_) async =>
        Left<Failure, MyProfileEntity>(RequestFailure("Request failure"))),
    act: (GetMyProfileCubit cubit) => cubit.getMyProfile(userId),
    expect: () => [
      GetMyProfileLoadingState(),
      GetMyProfileErrorState(failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<GetMyProfileCubit, GetMyProfileStates>(
    'Should emitted GetMyProfileLoadingState and GetMyProfileErrorState when get a UnauthorizedFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(userId)).thenAnswer((_) async =>
        Left<Failure, MyProfileEntity>(
            UnauthorizedFailure("Unauthorized failure"))),
    act: (GetMyProfileCubit cubit) => cubit.getMyProfile(userId),
    expect: () => [
      GetMyProfileLoadingState(),
      GetMyProfileErrorState(
          failure: UnauthorizedFailure("Unauthorized failure")),
    ],
  );
}
