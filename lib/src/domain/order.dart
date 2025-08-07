import 'package:testdaten/src/domain/app_user.dart';
import 'package:testdaten/src/domain/product.dart';

class Order {
  AppUser customer;
  List<Product> products;

  Order(this.customer, this.products);

  Map<String, dynamic> toMap() {
    return {
      'customer': customer.toMap(),
      'products': products.map((product) => product.toMap()).toList(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      AppUser.fromMap(map['customer'] as Map<String, dynamic>),
      (map['products'] as List)
          .map((product) => Product.fromMap(product as Map<String, dynamic>))
          .toList(),
    );
  }
}
