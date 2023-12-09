import 'package:comdig/src/modules/auth/register/infra/datasources/i_register_user_datasource.dart';
import 'package:comdig/src/modules/auth/register/infra/models/user_data_model.dart';
import 'package:comdig/src/modules/auth/register/infra/repositories/register_user_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RegisterUserDatasourceMock extends Mock
    implements IRegisterUserDatasource {}

main() {
  late RegisterUserDatasourceMock datasource;
  late RegisterUserRepository repository;

  setUp(() {
    datasource = RegisterUserDatasourceMock();
    repository = RegisterUserRepository(datasource: datasource);
  });

  const UserDataModel userDataModel = UserDataModel(
    name: "Name",
    lastname: "Lastname",
    cellphone: "(00)00000-0000",
    birthDate: "00/00/0000",
    email: "teste@email.com",
    password: "password",
    city: "City",
    uf: "UF",
  );

  test("Should return a Success Message for a Register User Method", () async {
    when(() => datasource.registerUser(userDataModel))
        .thenAnswer((_) async => "success");

    final result = await repository.registerUser(userDataModel);

    expect(result, const Right("success"));

    verify(() => datasource.registerUser(
          const UserDataModel(
            name: "Name",
            lastname: "Lastname",
            cellphone: "(00)00000-0000",
            birthDate: "00/00/0000",
            email: "teste@email.com",
            password: "password",
            city: "City",
            uf: "UF",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.registerUser(userDataModel))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.registerUser(userDataModel);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.registerUser(
          const UserDataModel(
            name: "Name",
            lastname: "Lastname",
            cellphone: "(00)00000-0000",
            birthDate: "00/00/0000",
            email: "teste@email.com",
            password: "password",
            city: "City",
            uf: "UF",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.registerUser(userDataModel))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.registerUser(userDataModel);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.registerUser(
          const UserDataModel(
            name: "Name",
            lastname: "Lastname",
            cellphone: "(00)00000-0000",
            birthDate: "00/00/0000",
            email: "teste@email.com",
            password: "password",
            city: "City",
            uf: "UF",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.registerUser(userDataModel))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.registerUser(userDataModel);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.registerUser(
          const UserDataModel(
            name: "Name",
            lastname: "Lastname",
            cellphone: "(00)00000-0000",
            birthDate: "00/00/0000",
            email: "teste@email.com",
            password: "password",
            city: "City",
            uf: "UF",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.registerUser(userDataModel)).thenThrow(message);

    final result = await repository.registerUser(userDataModel);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.registerUser(
          const UserDataModel(
            name: "Name",
            lastname: "Lastname",
            cellphone: "(00)00000-0000",
            birthDate: "00/00/0000",
            email: "teste@email.com",
            password: "password",
            city: "City",
            uf: "UF",
          ),
        )).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
