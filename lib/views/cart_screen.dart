import 'package:flutter/material.dart';
import 'package:grocery_app/providers/cart_provider.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider= context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Cart Screen",style: TextStyle(
            color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: cartProvider.cartItems.isEmpty?Center(
        child: Text("Your Cart Is Empty",style: TextStyle(
          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
        ),),
      ):Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.PRIMARY_COLOR,
                    ),
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      Color(0xFFF7FFF7),
                    ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(item.image,height: 100,width: 100,fit: BoxFit.cover,),),
                    Expanded(child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(item.name,style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
                      ),),
                      const SizedBox(height: 10,),
                      Text("Price: \$${item.price}",style: TextStyle(
                        color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
                      ),),
                        const SizedBox(height: 10,),
                        Row(children: [
                          InkWell(
                            onTap: (){
                              cartProvider.decreaseQty(item.id);
                            },
                            child: Container(
                              decoration:BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.PRIMARY_COLOR,
                              ),
                              child: Icon(Icons.keyboard_arrow_down),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(item.qty.toString(),style: TextStyle(
                              color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
                            ),),
                          ),
                          InkWell(
                            onTap: () {
                              cartProvider.increaseQty(item.id);
                            },
                            child: Container(
                              decoration:BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.PRIMARY_COLOR,
                              ),
                              child: Icon(Icons.keyboard_arrow_up),
                            ),
                          ),
                        ],),
                    ],),
                    ),
                    IconButton(onPressed: (){
                      cartProvider.removeItem(item.id);
                    }, icon: Icon(Icons.delete),),
                  ],),
                );
              }, separatorBuilder:(context, index) => SizedBox(height: 10,), itemCount: cartProvider.cartItems.length),
            ),
          Divider(
            color: AppColor.PRIMARY_COLOR,
          ),
          const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("SubTotal",style: TextStyle(
                color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
              ),),
              Text(cartProvider.subTotal.toString(),style: TextStyle(
                color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
              ),),
            ],),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Charges",style: TextStyle(
                  color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
                ),),
                Text(cartProvider.deliveryCharges.toString(),style: TextStyle(
                  color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
                ),),
              ],),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",style: TextStyle(
                  color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
                ),),
                Text(cartProvider.total.toString(),style: TextStyle(
                  color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
                ),),
              ],),
            Divider(
              color: AppColor.PRIMARY_COLOR,
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.09,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.PRIMARY_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: (){}, child: Text("Checkout",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),),
            ),
          ],
        ),
      ),
    );
  }
}
