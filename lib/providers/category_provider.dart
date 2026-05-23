import 'package:flutter/foundation.dart';
import 'package:grocery_app/model/product_model.dart';
import 'package:grocery_app/services/product_service.dart';

import '../model/grocery_model.dart';
import '../services/grocery_service.dart';

class CategoryProvider with ChangeNotifier{
  int _selectedIndex=0;
  int get selectedIndex=>_selectedIndex;
  /*changeCategory start here*/
void changeCategory(int index){
  _selectedIndex=index;
  notifyListeners();
}
/*changeCategory end here*/
List<GroceryModel> get categories=>GroceryService.categories;
  List<ProductModel> get products=>ProductService.products;

}