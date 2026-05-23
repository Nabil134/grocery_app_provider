import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class CartProvider with ChangeNotifier{
  final List<ProductModel> _cartItems=[];
  List<ProductModel> get cartItems =>_cartItems;
  /*addToCart start here*/
void addToCart(ProductModel product,BuildContext context){
final index = _cartItems.indexWhere((item) => item.id==product.id);
if(index>=0){
_cartItems[index].qty+=1;
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${product.name} already added into Cart" ),),);
}
else{
_cartItems.add(ProductModel(id: product.id, image: product.image, name: product.name, price: product.price,qty: 1));
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${product.name}  added into Cart" ),),);
}
notifyListeners();
}
/*addToCart end here*/
/*increaseQty start here*/
void increaseQty(int id){
  int index= _cartItems.indexWhere((item) => item.id==id);
  _cartItems[index].qty++;
  notifyListeners();
}
/*increaseQty end here*/
/*decreaseQty start here*/
  void decreaseQty(int id){
    int index= _cartItems.indexWhere((item) => item.id==id);
    if(_cartItems[index].qty>1){
      _cartItems[index].qty--;
    }
    else{
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }
/*decreaseQty end here*/
/*removeItem start here*/
  void removeItem(int id){
    _cartItems.removeWhere((item) => item.id==id);
    notifyListeners();
  }
/*removeItem end here*/
/*subTotal start here*/
double get subTotal{
  double total=0;
  for(var item in _cartItems){
    total+= item.price * item.qty;
  }
  return total;
}
/*subTotal end here*/
/*deliveryCharges start here*/
double get deliveryCharges{
  if(_cartItems.isEmpty) return 0;
  return subTotal>500?0:50;
}
/*deliveryCharges end here*/
/*total start here*/
double get total => deliveryCharges + subTotal;
/*total end here*/
}