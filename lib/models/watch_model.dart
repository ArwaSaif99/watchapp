class Watch {
  final int? id;
  final String? name;
  final String? description;
  final int? brandId;
  final int? watchModelId;
  final int? userId;
  final String? userName;
  final String? brandName;
  final String? watchModelName;
  final double? caseDiameter;
  final String? caseMaterial;
  final String? strapMaterial;
  final double? price;
  final String? color;
  final String? model;
  final String? referenceNumber;
  final String? serialNumber;

  final String? gender;
  final String? yearOfProduction;
  final String? condition;
  final int? cityId;
  final String? cityName;
  final int? packageId;
  final String? packageName;
  final double? packagePrice;
  final int? packageDays;
  final String? callNumber;
  final String? whatsappNumber;
  final String? featuredImage;
  final String? images;
  final DateTime? expirationDate;
  final String? status;
  final DateTime? createdAt;

  Watch({
    this.id,
    this.name,
    this.description,
    this.brandId,
    this.watchModelId,
    this.userId,
    this.userName,
    this.brandName,
    this.watchModelName,
    this.caseDiameter,
    this.caseMaterial,
    this.strapMaterial,
    this.price,
    this.color,
    this.model,
    this.referenceNumber,
    this.serialNumber,
    this.gender,
    this.yearOfProduction,
    this.condition,
    this.cityId,
    this.cityName,
    this.packageId,
    this.packageName,
    this.packagePrice,
    this.packageDays,
    this.callNumber,
    this.whatsappNumber,
    this.featuredImage,
    this.images,
    this.expirationDate,
    this.status,
    this.createdAt,
  });

  factory Watch.fromJson(Map<String, dynamic> json) {
    final data = json['data']['watches'][0];

    return Watch(
      id: data['id'] as int,
      name: data['name'] as String,
      description: data['description'] as String,
      brandId: data['brand_id'] as int,
      watchModelId: data['watch_model_id'] as int,
      userId: data['user_id'] as int,
      userName: data['user_name'] as String,
      brandName: data['brand_name'] as String,
      watchModelName: data['watch_model_name'] as String,
      caseDiameter: data['case_diameter'] as double,
      caseMaterial: data['case_material'] as String? ?? '',
      strapMaterial: data['strap_material'] as String? ?? '',
      price: data['price'] as double,
      color: data['color'] as String,
      model: data['model'] as String? ?? '',
      referenceNumber: data['reference_number'] as String? ?? '',
      serialNumber: data['serial_number'] as String? ?? '',
      gender: data['gender'] as String,
      yearOfProduction: data['year_of_production'] as String,
      condition: data['condition'] as String,
      cityId: data['city_id'] as int,
      cityName: data['city_name'] as String,
      packageId: data['package_id'] as int,
      packageName: data['package_name'] as String,
      packagePrice: data['package_price'] as double,
      packageDays: data['package_days'] as int,
      callNumber: data['call_number'] as String? ?? '',
      whatsappNumber: data['whatsapp_number'] as String,
      featuredImage: data['featured_image'] as String,
      images: (data['images']),
      expirationDate: DateTime.parse(data['expiration_date'] as String),
      status: data['status'] as String,
      createdAt: DateTime.parse(data['created_at'] as String),
    );
  }
  List<Map<String, dynamic>> imagesToJsonList(List<String> images) {
    return images.map((image) => {'url': image}).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'brand_id': brandId?.toString(),
      'user_id': userId?.toString(),
      'case_diameter': caseDiameter?.toString(),
      'case_material': caseMaterial ?? '',
      'strap_material': strapMaterial ?? '',
      'color': color,
      'model': model ?? '',
      'reference_number': referenceNumber ?? '',
      'serial_number': serialNumber ?? '',
      'gender': gender ?? '',
      'year_of_production': yearOfProduction ?? '',
      'condition': condition ?? '',
      'city_id': cityId?.toString(),
      'city_name': cityName ?? '',
      'package_id': packageId?.toString(),
      'package_name': packageName ?? '',
      'call_number': callNumber ?? '',
      'whatsapp_number': whatsappNumber ?? '',
      'featured_image': featuredImage ?? '',
      'expiration_date': expirationDate?.toIso8601String(),
      'status': status ?? '',
      'created_at': createdAt?.toIso8601String(),
      'images': images
    };
  }
}
