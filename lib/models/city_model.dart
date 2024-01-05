class CityModel {
  int id;
  String name;
  String country;
  String status;

  CityModel({
    required this.id,
    required this.name,
    required this.country,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country': country,
      'status': status,
    };
  }

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] as String,
      status: json['status'] as String,
    );
  }
}
