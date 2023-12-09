import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/entities/edit_user_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/usecases/edit_user_profile_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/presenter/blocs/cubits/edit_user_profile_cubit.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class EditUserProfileCubitMock extends Mock implements EditUserProfileCubit {}

class EditUserProfileUsecaseMock extends Mock
    implements EditUserProfileUsecase {}

void main() {
  late EditUserProfileCubit cubit;
  late EditUserProfileUsecase usecase;

  setUp(() {
    usecase = EditUserProfileUsecaseMock();
    cubit = EditUserProfileCubit(usecase: usecase);
  });

  EditUserProfileEntity editUserProfileEntity = const EditUserProfileEntity(
    id: "id",
    name: "name",
    lastname: "lastname",
    city: "city",
    uf: "uf",
    birthDate: "birthDate",
    cellphone: "cellphone",
  );

  blocTest<EditUserProfileCubit, EditUserProfileStates>(
    'When attempt to Edit User Profile for a User is made then EditUserProfileLoadingState and EditUserProfileSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => usecase(editUserProfileEntity))
          .thenAnswer((_) async => const Right<Failure, bool>(true));
    },
    act: (EditUserProfileCubit cubit) =>
        cubit.editUserProfile(editUserProfileEntity),
    expect: () => [
      EditUserProfileLoadingState(),
      EditUserProfileSuccessState(result: true),
    ],
  );

  blocTest<EditUserProfileCubit, EditUserProfileStates>(
    'Should emitted EditUserProfileLoadingState and EditUserProfileErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(editUserProfileEntity)).thenAnswer(
        (_) async => Left<Failure, bool>(GeneralFailure("failure"))),
    act: (EditUserProfileCubit cubit) =>
        cubit.editUserProfile(editUserProfileEntity),
    expect: () => [
      EditUserProfileLoadingState(),
      EditUserProfileErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<EditUserProfileCubit, EditUserProfileStates>(
    'Should emitted EditUserProfileLoadingState and EditUserProfileErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(editUserProfileEntity)).thenAnswer(
        (_) async => Left<Failure, bool>(ServerFailure("server failure"))),
    act: (EditUserProfileCubit cubit) =>
        cubit.editUserProfile(editUserProfileEntity),
    expect: () => [
      EditUserProfileLoadingState(),
      EditUserProfileErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<EditUserProfileCubit, EditUserProfileStates>(
    'Should emitted EditUserProfileLoadingState and EditUserProfileErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(editUserProfileEntity)).thenAnswer(
        (_) async =>
            Left<Failure, bool>(BadRequestFailure("BadRequest failure"))),
    act: (EditUserProfileCubit cubit) =>
        cubit.editUserProfile(editUserProfileEntity),
    expect: () => [
      EditUserProfileLoadingState(),
      EditUserProfileErrorState(
          failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<EditUserProfileCubit, EditUserProfileStates>(
    'Should emitted EditUserProfileLoadingState and EditUserProfileErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(editUserProfileEntity)).thenAnswer(
        (_) async => Left<Failure, bool>(RequestFailure("Request failure"))),
    act: (EditUserProfileCubit cubit) =>
        cubit.editUserProfile(editUserProfileEntity),
    expect: () => [
      EditUserProfileLoadingState(),
      EditUserProfileErrorState(failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<EditUserProfileCubit, EditUserProfileStates>(
    'Should emitted EditUserProfileLoadingState and EditUserProfileErrorState when get a UnauthorizedFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(editUserProfileEntity)).thenAnswer(
        (_) async =>
            Left<Failure, bool>(UnauthorizedFailure("Unauthorized failure"))),
    act: (EditUserProfileCubit cubit) =>
        cubit.editUserProfile(editUserProfileEntity),
    expect: () => [
      EditUserProfileLoadingState(),
      EditUserProfileErrorState(
          failure: UnauthorizedFailure("Unauthorized failure")),
    ],
  );
}
