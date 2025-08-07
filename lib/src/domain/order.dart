import 'package:testdaten/src/domain/app_user.dart';
import 'package:testdaten/src/domain/product.dart';

class Order {
  AppUser customer;
  List<Product> products;

  Order(this.customer, this.products);
}
