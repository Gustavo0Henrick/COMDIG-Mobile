import 'package:comdig/src/modules/dashboard/features/company/domain/repositories/i_get_company_data_repository.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/usecases/get_company_data_usecase.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetCompanyDataRepositoryMock extends Mock
    implements IGetCompanyDataRepository {}

main() {
  late GetCompanyDataRepositoryMock repository;
  late GetCompanyDataUsecase usecase;

  setUp(() {
    repository = GetCompanyDataRepositoryMock();
    usecase = GetCompanyDataUsecase(repository: repository);
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

  test("Should return a CompanyItemEntity from the GetCompanyDataById Method",
      () async {
    when(() => repository.getCompanyById(companyId))
        .thenAnswer((_) async => Right<Failure, CompanyItemEntity>(company));
    final result = await usecase(companyId);

    expect(
        result,
        Right(
          CompanyItemEntity(
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
          ),
        ));

    verify(() => repository.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get ServerFailure from the Repository", () async {
    String messageError = "Server Error";

    when(() => repository.getCompanyById(companyId)).thenAnswer((_) async =>
        Left<Failure, CompanyItemEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get GeneralFailure from the Repository", () async {
    String messageError = "General Error";
    when(() => repository.getCompanyById(companyId)).thenAnswer((_) async =>
        Left<Failure, CompanyItemEntity>(GeneralFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(GeneralFailure(messageError)));

    verify(() => repository.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get BadRequestFailure from the Repository", () async {
    String messageError = "BadRequest Error";
    when(() => repository.getCompanyById(companyId)).thenAnswer((_) async =>
        Left<Failure, CompanyItemEntity>(BadRequestFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(BadRequestFailure(messageError)));

    verify(() => repository.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get RequestFailure from the Repository", () async {
    String messageError = "Request Error";
    when(() => repository.getCompanyById(companyId)).thenAnswer((_) async =>
        Left<Failure, CompanyItemEntity>(RequestFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(RequestFailure(messageError)));

    verify(() => repository.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("Should get InvalidCredentialsFailure from the Repository", () async {
    String messageError = "InvalidCredentialsFailure Error";
    when(() => repository.getCompanyById(companyId)).thenAnswer((_) async =>
        Left<Failure, CompanyItemEntity>(
            InvalidCredentialsFailure(messageError)));
    final result = await usecase(companyId);

    expect(result, Left(InvalidCredentialsFailure(messageError)));

    verify(() => repository.getCompanyById(companyId)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
