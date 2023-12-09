import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/datasources/i_get_my_profile_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/models/my_profile_model.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/infra/repositories/get_my_profile_repository.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetMyProfileDatasourceMock extends Mock
    implements IGetMyProfileDatasource {}

main() {
  DateTime date = DateTime.parse("2023-10-19T11:42:07.424917Z");
  late GetMyProfileDatasourceMock datasource;
  late GetMyProfileRepository repository;

  setUp(() {
    datasource = GetMyProfileDatasourceMock();
    repository = GetMyProfileRepository(datasource: datasource);
  });

  String userId = "userId";

  MyProfileModel myProfile = MyProfileModel(
    id: "id",
    name: "name",
    lastname: "lastname",
    email: "email",
    birthDate: "birthDate",
    cellphone: "cellphone",
    city: "city",
    uf: "uf",
    createdAt: date.toUtc().toIso8601String(),
    updatedAt: date.toUtc().toIso8601String(),
  );

  test("Should return a MyProfileEntity from GetMyProfile Method", () async {
    when(() => datasource.getMyProfile(userId))
        .thenAnswer((_) async => myProfile);

    final result = await repository.getMyProfile(userId);

    expect(result, Right(myProfile));

    verify(() => datasource.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.getMyProfile(userId))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.getMyProfile(userId);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.getMyProfile(userId))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.getMyProfile(userId);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.getMyProfile(userId))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.getMyProfile(userId);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.getMyProfile(userId)).thenThrow(message);

    final result = await repository.getMyProfile(userId);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a UnauthorizedFailure when get UnauthorizedException from datasource",
      () async {
    var message = "Invalid Credentials Error";
    when(() => datasource.getMyProfile(userId))
        .thenThrow(UnauthorizedException(message: message, statusCode: 401));

    final result = await repository.getMyProfile(userId);

    expect(result, Left(UnauthorizedFailure(message)));

    verify(() => datasource.getMyProfile(userId)).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
