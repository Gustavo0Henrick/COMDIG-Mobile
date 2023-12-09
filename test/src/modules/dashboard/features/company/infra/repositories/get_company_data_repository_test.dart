import 'package:comdig/src/modules/dashboard/features/company/infra/datasources/i_get_company_data_datasource.dart';
import 'package:comdig/src/modules/dashboard/features/company/infra/repositories/get_company_data_repository.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/exceptions.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetCompanyDataDatasourceMock extends Mock
    implements IGetCompanyDataDatasource {}

main() {
  late IGetCompanyDataDatasource datasource;
  late GetCompanyDataRepository repository;

  setUp(() {
    datasource = GetCompanyDataDatasourceMock();
    repository = GetCompanyDataRepository(datasource: datasource);
  });

  
  String companyId = "companyId";

  DateTime date = DateTime.now();

  CompanyItemEntity company = CompanyItemEntity(
    id: "id",
    email: "email",
    category: "category",
    name: "name",
    phone: "phone",
    site: "site",
    image: "image",
    createdAt: date,
    updatedAt: date,
    address: "address",
    city: "city",
    uf: "uf",
    friday: "friday",
    monday: "monday",
    saturday: "saturday",
    sunday: "sunday",
    thursday: "thursday",
    tuesday: "tuesday",
    wednesday: "wednesday",
  );

  test("Should return a Success Message from GetCompanyData Method", () async {
    when(() => datasource.getCompanyById(companyId)).thenAnswer((_) async => company);

    final result = await repository.getCompanyById(companyId);

    expect(
      result,
      Right(company),
    );

    verify(() => datasource.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test("Should return a ServerFailure when get ServerException from datasource",
      () async {
    var message = "Server Error";
    when(() => datasource.getCompanyById(companyId))
        .thenThrow(ServerException(message: message, statusCode: 500));

    final result = await repository.getCompanyById(companyId);

    expect(result, Left(ServerFailure(message)));

    verify(() => datasource.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a BadRequestFailure when get BadRequestException from datasource",
      () async {
    var message = "BadRequest Error";
    when(() => datasource.getCompanyById(companyId))
        .thenThrow(BadRequestException(message: message, statusCode: 400));

    final result = await repository.getCompanyById(companyId);

    expect(result, Left(BadRequestFailure(message)));

    verify(() => datasource.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a RequestFailure when get RequestException from datasource",
      () async {
    var message = "Request Error";
    when(() => datasource.getCompanyById(companyId))
        .thenThrow(RequestException(message: message, statusCode: 408));

    final result = await repository.getCompanyById(companyId);

    expect(result, Left(RequestFailure(message)));

    verify(() => datasource.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a GeneralFailure when get GeneralException from datasource",
      () async {
    var message = "General Error";
    when(() => datasource.getCompanyById(companyId)).thenThrow(message);

    final result = await repository.getCompanyById(companyId);

    expect(result, Left(GeneralFailure(message)));

    verify(() => datasource.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });

  test(
      "Should return a UnauthorizedFailure when get UnauthorizedException from datasource",
      () async {
    var message = "Unauthorized Error";
    when(() => datasource.getCompanyById(companyId))
        .thenThrow(UnauthorizedException(message: message, statusCode: 403));

    final result = await repository.getCompanyById(companyId);

    expect(result, Left(UnauthorizedFailure(message)));

    verify(() => datasource.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
