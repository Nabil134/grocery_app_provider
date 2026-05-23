import 'package:flutter/material.dart';
import 'package:grocery_app/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../utils/app_colors.dart';

class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favProvider= context.watch<FavoriteProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Favorite Screen",style: TextStyle(
          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
        child: favProvider.favItem.isEmpty?Center(child: Text("Favorite List is Empty",style: TextStyle(
          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
        ),),):
        GridView.builder(
          itemCount: favProvider.favItem.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
            childAspectRatio: 0.66,
        ), itemBuilder: (context, index) {
          final product = favProvider.favItem[index];
          return  Container(
            width: MediaQuery.of(context).size.width*0.5,
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
favProvider.removeItem(product.id);
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
                    child:Icon(Icons.favorite,color: Colors.red,),
                  ),
                ),
              ),
              Align(
                alignment:Alignment.bottomRight,
                child: InkWell(
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
          );

        },),
      ),
    );
  }
}
