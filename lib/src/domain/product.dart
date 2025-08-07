class Product {
  String name;
  String description;
  double price;
  String url;

  Product(this.name, this.description, this.price, this.url);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'url': url,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['name'],
      map['description'],
      map['price'],
      map['url'] ?? '',
    );
  }
}
