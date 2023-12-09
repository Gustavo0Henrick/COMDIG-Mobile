import 'package:comdig/src/shared/entities/company_item_entity.dart';

class CompanyItemModel extends CompanyItemEntity {
  const CompanyItemModel({
    required super.id,
    required super.name,
    required super.category,
    required super.city,
    required super.uf,
    required super.email,
    required super.createdAt,
    required super.updatedAt,
    required super.image,
    required super.phone,
    required super.site,
    required super.address,
    required super.sunday,
    required super.monday,
    required super.tuesday,
    required super.wednesday,
    required super.thursday,
    required super.friday,
    required super.saturday,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'city': city,
      'uf': uf,
      'email': email,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'image': image,
      'address': address,
      'phone': phone,
      'site': site,
      'sunday': sunday,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
    };
  }

  factory CompanyItemModel.fromMap(Map<String, dynamic> map) {
    return CompanyItemModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      email: map['email'] ?? '',
      city: map['city'] ?? '',
      uf: map['uf'] ?? '',
      updatedAt: DateTime.parse(map['updatedAt'] ?? ''),
      createdAt: DateTime.parse(map['createdAt'] ?? ''),
      image: map['image'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
      site: map['site'] ?? '',
      sunday: map['sunday'] ?? '',
      monday: map['monday'] ?? '',
      tuesday: map['tuesday'] ?? '',
      wednesday: map['wednesday'] ?? '',
      thursday: map['thursday'] ?? '',
      friday: map['friday'] ?? '',
      saturday: map['saturday'] ?? '',
    );
  }
}
