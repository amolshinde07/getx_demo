import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/cart_controller.dart';
import 'package:getxdemo/controllers/shopping_controller.dart';


class Shopping_page extends StatelessWidget {
  final shoppingcontroller=Get.put(ShoppingController());
  final cartController=Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){

        },
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart
        ),
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
            cartController.count.toString()
            );
          }
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.products.length,
                        itemBuilder: (context,index){
                      return  Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDescription}'),
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text('Add to Cart'),
                              ),
                              Obx(() => IconButton(
                                icon: controller
                                    .products[index].isFavorite.value
                                    ? Icon(Icons.check_box_rounded)
                                    : Icon(Icons
                                    .check_box_outline_blank_outlined),
                                onPressed: () {
                                  controller.products[index].isFavorite
                                      .toggle();
                                },
                              ))
                            ],
                          ),
                        ),
                      );
                    });
                  }
                ),
              ),
              GetBuilder<CartController>(

                  builder:(controller){
                    return Text(
                        'GetBuilder Total: ${cartController.testamount}',
                        style: TextStyle(
                        fontSize: 17
                    ),

                    );

              }),
              GetX<CartController>(
                builder: (controller) {
                  return Text(
                    'GetX Total:\$ ${controller.totalprice}',
                    style: TextStyle(
                      fontSize: 17
                    ),
                  );
                }
              ),
              Obx((){
                return Text(
                    'Obx Total:\$ ${cartController.totalprice}',
                  style: TextStyle(
                      fontSize: 17
                  ),
                );
              }),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
