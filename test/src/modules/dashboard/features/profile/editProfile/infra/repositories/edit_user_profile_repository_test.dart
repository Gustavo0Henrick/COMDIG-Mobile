import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/datasources/i_edit_user_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/models/edit_user_profile_model.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/infra/repositories/edit_user_profile_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class EditUserProfileDatasourceMock extends Mock
    implements IEditUserProfileDatasource {}

main() {
  late EditUserProfileDatasourceMock datasource;
  late EditUserProfileRepository repository;

  setUp(() {
    datasource = EditUserProfileDatasourceMock();
    repository = EditUserProfileRepository(datasource: datasource);
  });

  EditUserProfileModel editUserProfileModel = const EditUserProfileModel(
      id: "id",
      name: "name",
      lastname: "lastname",
      city: "city",
      uf: "uf",
      birthDate: "birthDate",
      cellphone: "cellphone",
  );

  test("Should return a True from EditUserProfile Method", () async {
    when(() => datasource.editUserProfile(editUserProfileModel))
        .thenAnswer((_) async => true);

    final result = await repository.editUserProfile(editUserProfileModel);

    expect(result, const Right(true));

    verify(() => datasource.editUserProfile(
          const EditUserProfileModel(
        id: "id",
      name: "name",
      lastname: "lastname",
      city: "city",
      uf: "uf",
      birthDate: "birthDate",
      cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.editUserProfile(editUserProfileModel))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.editUserProfile(editUserProfileModel);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.editUserProfile(
          const EditUserProfileModel(
       id: "id",
      name: "name",
      lastname: "lastname",
      city: "city",
      uf: "uf",
      birthDate: "birthDate",
      cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.editUserProfile(editUserProfileModel))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.editUserProfile(editUserProfileModel);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.editUserProfile(
          const EditUserProfileModel(
      id: "id",
      name: "name",
      lastname: "lastname",
      city: "city",
      uf: "uf",
      birthDate: "birthDate",
      cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.editUserProfile(editUserProfileModel))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.editUserProfile(editUserProfileModel);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.editUserProfile(
          const EditUserProfileModel(
      id: "id",
      name: "name",
      lastname: "lastname",
      city: "city",
      uf: "uf",
      birthDate: "birthDate",
      cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.editUserProfile(editUserProfileModel))
        .thenThrow(message);

    final result = await repository.editUserProfile(editUserProfileModel);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.editUserProfile(
          const EditUserProfileModel(
      id: "id",
      name: "name",
      lastname: "lastname",
      city: "city",
      uf: "uf",
      birthDate: "birthDate",
      cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a UnauthorizedFailure when get UnauthorizedException from datasource",
      () async {
    var message = "Invalid Credentials Error";
    when(() => datasource.editUserProfile(editUserProfileModel))
        .thenThrow(UnauthorizedException(message: message, statusCode: 401));

    final result = await repository.editUserProfile(editUserProfileModel);

    expect(result, Left(UnauthorizedFailure(message)));

    verify(() => datasource.editUserProfile(
          const EditUserProfileModel(
      id: "id",
      name: "name",
      lastname: "lastname",
      city: "city",
      uf: "uf",
      birthDate: "birthDate",
      cellphone: "cellphone",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
