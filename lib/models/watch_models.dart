class WatchModels {
  final int id;
  final String name;
  final int brandId;
  final String brandName;
  final String status;

  WatchModels({
    required this.id,
    required this.name,
    required this.brandId,
    required this.brandName,
    required this.status,
  });

  factory WatchModels.fromJson(Map<String, dynamic> json) {
    return WatchModels(
      id: json['id'],
      name: json['name'],
      brandId: json['brand_id'],
      brandName: json['brand_name'],
      status: json['status'],
    );
  }
}
