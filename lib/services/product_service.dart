import 'package:grocery_app/model/product_model.dart';

import '../model/grocery_model.dart';

class ProductService{
  static List<ProductModel> products=[
ProductModel(id:1,image: "assets/images/banana.png", name: "Banana", price: 9.99),
    ProductModel(id:2,image: "assets/images/egg_4.png", name: "Egg", price: 7.99),
    ProductModel(id:3,image: "assets/images/milk.png", name: "Milk", price: 4.99),
  ];
}
