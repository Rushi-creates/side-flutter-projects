class FoodModel {
  String? id;
  String name;
  String description;
  String price;
  String? pfpImgUrl;

  FoodModel({
    this.id,
    // required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.pfpImgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'pfpImgUrl': pfpImgUrl,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      id: map['id'],
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      pfpImgUrl: map['pfpImgUrl'],
    );
  }
}
