import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/entities/my_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/repositories/i_get_my_profile_repository.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/domain/usecases/get_my_profile_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class GetMyProfileRepositoryMock extends Mock
    implements IGetMyProfileRepository {}

main() {
  late GetMyProfileRepositoryMock repository;
  late GetMyProfileUsecase usecase;

  setUp(() {
    repository = GetMyProfileRepositoryMock();
    usecase = GetMyProfileUsecase(repository: repository);
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
    uf: "uf",
    createdAt: "createdAt",
    updatedAt: "updatedAt",
  );

  test("Should return a MyProfileEntity from GetMyProfile Method", () async {
    when(() => repository.getMyProfile(userId))
        .thenAnswer((_) async => Right<Failure, MyProfileEntity>(myProfile));
    final result = await usecase(userId);

    expect(result, Right(myProfile));

    verify(() => repository.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.getMyProfile(userId)).thenAnswer((_) async =>
        Left<Failure, MyProfileEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get UnauthorizedFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.getMyProfile(userId)).thenAnswer((_) async =>
        Left<Failure, MyProfileEntity>(UnauthorizedFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(UnauthorizedFailure(messageError)));

    verify(() => repository.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.getMyProfile(userId)).thenAnswer((_) async =>
        Left<Failure, MyProfileEntity>(GeneralFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.getMyProfile(userId)).thenAnswer((_) async =>
        Left<Failure, MyProfileEntity>(BadRequestFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.getMyProfile(userId)).thenAnswer((_) async =>
        Left<Failure, MyProfileEntity>(RequestFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.getMyProfile(userId)).thenAnswer((_) async =>
        Left<Failure, MyProfileEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(userId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
