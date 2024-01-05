class Brand {
  final int id;
  final String name;
  final String logo;
  final String status;

  Brand({
    required this.id,
    required this.name,
    required this.logo,
    required this.status,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'status': status,
    };
  }
}
