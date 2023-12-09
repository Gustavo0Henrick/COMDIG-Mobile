import 'package:comdig/src/modules/auth/login/infra/datasources/i_get_my_self_datasource.dart';
import 'package:comdig/src/modules/auth/login/infra/repositories/get_my_self_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetMySelfDatasourceMock extends Mock implements IGetMySelfDatasource {}

main() {
  late IGetMySelfDatasource datasource;
  late GetMySelfRepository repository;

  setUp(() {
    datasource = GetMySelfDatasourceMock();
    repository = GetMySelfRepository(datasource: datasource);
  });

  UserModel userModel = const UserModel(
    id: "id",
    name: "name",
    lastname: "lastname",
    email: "email",
    cellphone: "cellphone",
    city: "City",
    uf: "UF",
    birthDate: "birthDate",
    createdAt: "createdAt",
    updatedAt: "updatedAt",
  );

  test("Should return a Success Message from GetMySelf Method", () async {
    when(() => datasource.getMySelf("id")).thenAnswer((_) async => userModel);

    final result = await repository.getMySelf("id");

    expect(
      result,
      const Right(
        UserModel(
          id: "id",
          name: "name",
          lastname: "lastname",
          email: "email",
          cellphone: "cellphone",
          birthDate: "birthDate",
          city: "City",
          uf: "UF",
          createdAt: "createdAt",
          updatedAt: "updatedAt",
        ),
      ),
    );

    verify(() => datasource.getMySelf("id")).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.getMySelf("id"))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.getMySelf("id");

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.getMySelf("id")).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.getMySelf("id"))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.getMySelf("id");

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.getMySelf("id")).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.getMySelf("id"))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.getMySelf("id");

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.getMySelf("id")).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.getMySelf("id")).thenThrow(message);

    final result = await repository.getMySelf("id");

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.getMySelf("id")).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a UnauthorizedFailure when get UnauthorizedException from datasource",
      () async {
    var message = "Unauthorized Error";
    when(() => datasource.getMySelf("id"))
        .thenThrow(UnauthorizedException(message: message, statusCode: 403));

    final result = await repository.getMySelf("id");

    expect(result, Left(UnauthorizedFailure(message)));

    verify(() => datasource.getMySelf("id")).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
