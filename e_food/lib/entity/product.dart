import 'package:intl/intl.dart';

class Product {
  String name;
  String img;
  num price;
  String description;
  String subtitle;
  num time;

  Product(this.name, this.img, this.price, this.description, this.subtitle,
      this.time);

  String priceLabel() {
    return NumberFormat.simpleCurrency(locale: 'pt_BR').format(price);
  }
}
