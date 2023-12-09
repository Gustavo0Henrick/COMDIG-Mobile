import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/models/company_item_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late CompanyItemModel companyItemModel;

  DateTime date = DateTime.now();

  setUp(() {
    companyItemModel = CompanyItemModel(
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
  });

  test("Should be a subclass of CompanyItemEntity", () {
    expect(companyItemModel, isA<CompanyItemEntity>());
  });

  test("Should return a valid CompanyItemModel from a Map", () {
    final Map<String, dynamic> map = {
      "id": "id",
      "email": "email",
      "category": "category",
      "name": "name",
      "phone": "phone",
      "site": "site",
      "image": "image",
      "createdAt": date.toUtc().toIso8601String(),
      "updatedAt": date.toUtc().toIso8601String(),
      "address": "address",
      "city": "city",
      "uf": "uf",
      "friday": "friday",
      "monday": "monday",
      "saturday": "saturday",
      "sunday": "sunday",
      "thursday": "thursday",
      "tuesday": "tuesday",
      "wednesday": "wednesday",
    };

    final result = CompanyItemModel.fromMap(map);

    expect(result, isA<CompanyItemModel>());
  });

  test("Should return Map containing the CompanyItemModel data", () {
    final expectedMap = {
      "id": "id",
      "email": "email",
      "category": "category",
      "name": "name",
      "phone": "phone",
      "site": "site",
      "image": "image",
      "createdAt": date,
      "updatedAt": date,
      "address": "address",
      "city": "city",
      "uf": "uf",
      "friday": "friday",
      "monday": "monday",
      "saturday": "saturday",
      "sunday": "sunday",
      "thursday": "thursday",
      "tuesday": "tuesday",
      "wednesday": "wednesday",
    };

    final result = companyItemModel.toMap();

    expect(result, expectedMap);
  });
}
