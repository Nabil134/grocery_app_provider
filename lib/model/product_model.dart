class ProductModel {

  final int id;
  final String image;
  final String name;
  final double price;
  int qty;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    this.qty=1,
  });
}