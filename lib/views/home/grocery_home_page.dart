import 'package:flutter/material.dart';
import 'package:grocery_app/providers/category_provider.dart';
import 'package:grocery_app/providers/favorite_provider.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/views/cart_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';

class GroceryHomePage extends StatelessWidget {
  const GroceryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider= context.watch<CategoryProvider>();
    final cartProvider= context.watch<CartProvider>();
    final favProvider= context.watch<FavoriteProvider>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            /*first portion start here*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                    children: [
                      TextSpan(text: "Hello,"),
                      TextSpan(text: "Ella\n",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: AppColor.PRIMARY_COLOR,
                      ),),
                      TextSpan(text: "What do you need",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color:AppColor.GREY_COLOR,
                      ),),
                    ],
                  ),
                ),
                /*CartIcon start here*/
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),),);
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Icon(Icons.shopping_cart,size: 30,),
                      ),
                      cartProvider.cartItems.isEmpty?SizedBox():Positioned(
                        right: -6,
                        top: -6,
                        child: Container(
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(cartProvider.cartItems.length.toString(),
                              style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                  /*CartIcon end here*/
              ],),
            ),
            /*first portion end here*/
            /*second portion start here*/
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: AppColor.PRIMARY_COLOR,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.green[50],
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search for item here",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            /*second portion end here*/
            const SizedBox(height: 10,),
            /*third portion start here*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: [
                Text("Category",style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),),
                const Spacer(),
                Text("See All",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColor.GREY_COLOR,
                ),),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: AppColor.GREY_COLOR,
                ),
              ],),
            ),
            /*third portion end here*/
            /*four portion start here*/
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 5),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categoryProvider.categories.length,
                  itemBuilder: (context, index) {
                  final grocery= categoryProvider.categories[index];
                  return GestureDetector(
                    onTap: (){
                      categoryProvider.changeCategory(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: categoryProvider.selectedIndex==index?2:1,
                            color: categoryProvider.selectedIndex==index?AppColor.PRIMARY_COLOR:Colors.black45,
                          ),
                        ),
                        child: Column(children: [
                         ClipOval(
                           child: Image.network(grocery.image,width: 70,height: 70,fit: BoxFit.cover,
                             errorBuilder: (context, error, stackTrace) => Container(
                               height: 70,
                               width: 70,
                               color: Colors.grey.shade200,
                               child: Icon(Icons.error_outline,color: Colors.red,),
                             ),
                           ),
                         ),
                          const SizedBox(height: 5,),
                          Text(grocery.name,style: TextStyle(
                            fontWeight:categoryProvider.selectedIndex==index? FontWeight.bold:FontWeight.w500,
                            color: categoryProvider.selectedIndex==index?AppColor.PRIMARY_COLOR:Colors.black45,

                          ),),
                          const SizedBox(height: 10,),
                        ],),
                      ),
                    ),
                  );
                },),
              ),
            ),
            /*four portion end here*/
            const SizedBox(height: 10,),
            /*five portion start here*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: [
                Text("Category",style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),),
                const Spacer(),
                Text("See All",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColor.GREY_COLOR,
                ),),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: AppColor.GREY_COLOR,
                ),
              ],),
            ),
            /*five portion end here*/
            const SizedBox(height: 20,),
            /*last portion start here*/
           SizedBox(
             height: MediaQuery.of(context).size.height*0.33,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount:categoryProvider.products.length,
               shrinkWrap: true,
               itemBuilder: (context, index) {
                 final product = categoryProvider.products[index];
               return  Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 12),
                 child: Container(
                   width: MediaQuery.of(context).size.width*0.55,
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
                     borderRadius: BorderRadius.circular(25),
                   ),
                   child: Stack(children: [
                     Column(
                       children: [
                       Image.asset(product.image,height: 100,
                         width: double.infinity,
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(product.name,style: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w700,
                           ),),
                           Text("\$${product.price}",style: TextStyle(
                             fontSize: 13,
                             fontWeight: FontWeight.w500,
                             color: AppColor.PRIMARY_COLOR,
                           ),),
                         ],
                       ),
                     ],),
                     Align(
                       alignment:Alignment.bottomLeft,
                       child: InkWell(
                         onTap: (){
                           favProvider.toggleFav(product);
                         },
                         child: Container(height: 50,
                           width: 50,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             border: Border.all(
                               color: AppColor.PRIMARY_COLOR,
                             ),
                             borderRadius: BorderRadius.only(
                               topRight: Radius.circular(20),
                               bottomLeft: Radius.circular(25),
                             ),
                           ),
                           child:favProvider.isFavorite(product.id)?Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_border,color: Colors.green,),
                         ),
                       ),
                     ),
                     Align(
                       alignment:Alignment.bottomRight,
                       child: InkWell(
                         onTap: () => cartProvider.addToCart(product, context),
                         child: Container(height: 50,
                           width: 50,
                           decoration: BoxDecoration(
                             color: AppColor.PRIMARY_COLOR,
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(20),
                               bottomRight:
                               Radius.circular(25),
                             ),
                           ),
                           child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                         ),
                       ),
                     ),
                   ],),
                 ),
               );
             },),
           ),
            /*last portion end here*/
            const SizedBox(height: 20,),
          ],),
        ),
      ),);
  }
}
