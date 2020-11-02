import 'package:get/get.dart';
import 'package:getxdemo/models/product.dart';

class CartController extends GetxController{
  var cartItems=List<Product>().obs;
  int get count=>cartItems.length;
  double get totalprice=>cartItems.fold(0, (sum,item ) => sum+item.price);
  var testamount=0.0;

  addToCart(Product product){
    cartItems.add(product);  //getx

    testamount=totalprice;  //getbuilder
    update();               //getbuilder
  }
}