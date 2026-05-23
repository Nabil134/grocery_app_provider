import 'package:flutter/cupertino.dart';

import '../model/product_model.dart';

class FavoriteProvider with ChangeNotifier{
  final List<ProductModel> _favItems=[];
  List<ProductModel> get favItem=>_favItems;
  /*toggleFav start here*/
void toggleFav(ProductModel product){
  final index= _favItems.indexWhere((item) => item.id==product.id);
  if(index>=0){
    _favItems.removeAt(index);
  }
  else{
    _favItems.add(product);
  }
  notifyListeners();
}
/*toggleFav end here*/
/*isFavorite start here*/
bool isFavorite(int id)=>_favItems.any((item) =>item.id==id);
/*isFavorite end here*/
/*removeItem start here*/
void removeItem(int id){
  _favItems.removeWhere((item) => item.id==id);
notifyListeners();
}
/*removeItem end here*/
}