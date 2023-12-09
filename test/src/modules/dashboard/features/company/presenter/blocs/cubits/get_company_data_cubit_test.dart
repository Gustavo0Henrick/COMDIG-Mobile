import 'package:comdig/src/modules/dashboard/features/company/domain/usecases/get_company_data_usecase.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/blocs/cubits/get_company_data_cubit.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/failures.dart';
import 'package:comdig/src/shared/storages/i_secure_storage_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class GetCompanyDataCubitMock extends Mock implements GetCompanyDataCubit {}

class GetCompanyDataUsecaseMock extends Mock implements GetCompanyDataUsecase {}

class SecureStorageManagerMock extends Mock implements ISecureStorageManager {}

void main() {
  late GetCompanyDataCubit cubit;
  late GetCompanyDataUsecase usecase;
  late ISecureStorageManager storage;

  setUp(() {
    usecase = GetCompanyDataUsecaseMock();
    storage = SecureStorageManagerMock();
    cubit = GetCompanyDataCubit(usecase: usecase);
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

  blocTest<GetCompanyDataCubit, GetCompanyDataStates>(
    'When attempt to GetCompanyData of an User is made then GetCompanyDataLoadingState and GetCompanyDataSuccessState are emitted',
    build: () => cubit,
    setUp: () {
      when(() => storage.saveData(any(), any())).thenAnswer((_) async => true);
      when(() => usecase(companyId))
          .thenAnswer((_) async => Right<Failure, CompanyItemEntity>(company));
    },
    act: (GetCompanyDataCubit cubit) => cubit.getCompanyData(companyId),
    expect: () => [
      GetCompanyDataLoadingState(),
      GetCompanyDataSuccessState(
        result: CompanyItemEntity(
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
      ),
    ],
  );

  blocTest<GetCompanyDataCubit, GetCompanyDataStates>(
    'Should emitted GetCompanyDataLoadingState and GetCompanyDataErrorState when get a GeneralFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer((_) async =>
        Left<Failure, CompanyItemEntity>(GeneralFailure("failure"))),
    act: (GetCompanyDataCubit cubit) => cubit.getCompanyData(companyId),
    expect: () => [
      GetCompanyDataLoadingState(),
      GetCompanyDataErrorState(failure: GeneralFailure("failure")),
    ],
  );

  blocTest<GetCompanyDataCubit, GetCompanyDataStates>(
    'Should emitted GetCompanyDataLoadingState and GetCompanyDataErrorState when get a ServerFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer((_) async =>
        Left<Failure, CompanyItemEntity>(ServerFailure("server failure"))),
    act: (GetCompanyDataCubit cubit) => cubit.getCompanyData(companyId),
    expect: () => [
      GetCompanyDataLoadingState(),
      GetCompanyDataErrorState(failure: ServerFailure("server failure")),
    ],
  );

  blocTest<GetCompanyDataCubit, GetCompanyDataStates>(
    'Should emitted GetCompanyDataLoadingState and GetCompanyDataErrorState when get a BadRequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer((_) async =>
        Left<Failure, CompanyItemEntity>(
            BadRequestFailure("BadRequest failure"))),
    act: (GetCompanyDataCubit cubit) => cubit.getCompanyData(companyId),
    expect: () => [
      GetCompanyDataLoadingState(),
      GetCompanyDataErrorState(
          failure: BadRequestFailure("BadRequest failure")),
    ],
  );

  blocTest<GetCompanyDataCubit, GetCompanyDataStates>(
    'Should emitted GetCompanyDataLoadingState and GetCompanyDataErrorState when get a RequestFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer((_) async =>
        Left<Failure, CompanyItemEntity>(RequestFailure("Request failure"))),
    act: (GetCompanyDataCubit cubit) => cubit.getCompanyData(companyId),
    expect: () => [
      GetCompanyDataLoadingState(),
      GetCompanyDataErrorState(failure: RequestFailure("Request failure")),
    ],
  );

  blocTest<GetCompanyDataCubit, GetCompanyDataStates>(
    'Should emitted GetCompanyDataLoadingState and GetCompanyDataErrorState when get a UnauthorizedFailure',
    build: () => cubit,
    setUp: () => when(() => usecase(companyId)).thenAnswer((_) async =>
        Left<Failure, CompanyItemEntity>(
            UnauthorizedFailure("Invalid Credentials failure"))),
    act: (GetCompanyDataCubit cubit) => cubit.getCompanyData(companyId),
    expect: () => [
      GetCompanyDataLoadingState(),
      GetCompanyDataErrorState(
          failure: UnauthorizedFailure("Invalid Credentials failure")),
    ],
  );
}
