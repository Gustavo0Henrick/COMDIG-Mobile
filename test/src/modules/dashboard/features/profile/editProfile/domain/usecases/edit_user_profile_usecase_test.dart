import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/entities/edit_user_profile_entity.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/repositories/i_edit_user_profile_repository.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/domain/usecases/edit_user_profile_usecase.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class EditUserProfileRepositoryMock extends Mock
    implements IEditUserProfileRepository {}

main() {
  late EditUserProfileRepositoryMock repository;
  late EditUserProfileUsecase usecase;

  setUp(() {
    repository = EditUserProfileRepositoryMock();
    usecase = EditUserProfileUsecase(repository: repository);
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

  test("Should return a True from EditUserProfile Method", () async {
    when(() => repository.editUserProfile(editUserProfileEntity))
        .thenAnswer((_) async => const Right<Failure, bool>(true));
    final result = await usecase(editUserProfileEntity);

    expect(result, const Right(true));

    verify(() => repository.editUserProfile(
          const EditUserProfileEntity(
            id: "id",
            name: "name",
            lastname: "lastname",
            city: "city",
            uf: "uf",
            birthDate: "birthDate",
            cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.editUserProfile(editUserProfileEntity)).thenAnswer(
        (_) async =>
            Left<Failure, bool>(InvalidCredentialsFailure(messageError)));
    final result = await usecase(editUserProfileEntity);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.editUserProfile(
          const EditUserProfileEntity(
            id: "id",
            name: "name",
            lastname: "lastname",
            city: "city",
            uf: "uf",
            birthDate: "birthDate",
            cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get UnauthorizedFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.editUserProfile(editUserProfileEntity)).thenAnswer(
        (_) async => Left<Failure, bool>(UnauthorizedFailure(messageError)));
    final result = await usecase(editUserProfileEntity);

    expect(result, Left(UnauthorizedFailure(messageError)));

    verify(() => repository.editUserProfile(
          const EditUserProfileEntity(
            id: "id",
            name: "name",
            lastname: "lastname",
            city: "city",
            uf: "uf",
            birthDate: "birthDate",
            cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.editUserProfile(editUserProfileEntity)).thenAnswer(
        (_) async => Left<Failure, bool>(GeneralFailure(messageError)));
    final result = await usecase(editUserProfileEntity);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.editUserProfile(
          const EditUserProfileEntity(
            id: "id",
            name: "name",
            lastname: "lastname",
            city: "city",
            uf: "uf",
            birthDate: "birthDate",
            cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.editUserProfile(editUserProfileEntity)).thenAnswer(
        (_) async => Left<Failure, bool>(BadRequestFailure(messageError)));
    final result = await usecase(editUserProfileEntity);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.editUserProfile(
          const EditUserProfileEntity(
            id: "id",
            name: "name",
            lastname: "lastname",
            city: "city",
            uf: "uf",
            birthDate: "birthDate",
            cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.editUserProfile(editUserProfileEntity)).thenAnswer(
        (_) async => Left<Failure, bool>(RequestFailure(messageError)));
    final result = await usecase(editUserProfileEntity);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.editUserProfile(
          const EditUserProfileEntity(
            id: "id",
            name: "name",
            lastname: "lastname",
            city: "city",
            uf: "uf",
            birthDate: "birthDate",
            cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.editUserProfile(editUserProfileEntity)).thenAnswer(
        (_) async =>
            Left<Failure, bool>(InvalidCredentialsFailure(messageError)));
    final result = await usecase(editUserProfileEntity);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.editUserProfile(
          const EditUserProfileEntity(
            id: "id",
            name: "name",
            lastname: "lastname",
            city: "city",
            uf: "uf",
            birthDate: "birthDate",
            cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(repository);
  });
}
