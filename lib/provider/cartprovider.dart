import 'package:flutter/foundation.dart';
import 'package:furniture/data/productdata.dart';

class Cartprovider extends ChangeNotifier{
  final List<ProductModel>cart=[];


  //ADD TO CART

  add_cart(ProductModel product){
    int index=cart.indexWhere((item)=>item.name==product.name);
    if(index !=-1)
    {
      cart[index].quantity++;
    }
    else{
      cart.add(product);

    }
    notifyListeners();
  }

  //REMOVE FROM CART
  remove_cart(ProductModel product){
  
  cart.remove(product);
    notifyListeners();
  }



  //ADD QUANTITY
  add_quantity(ProductModel product){
    int index=cart.indexWhere((item)=>item.name==product.name);
    if(index !=-1)
    {
      cart[index].quantity+=1;
    }
    notifyListeners();
  }



  //MINUS QUANTITY
  remove_quantity(ProductModel product) {
    int index =
        cart.indexWhere((item) => item.name == product.name);

    if (index == -1) return;

    if (cart[index].quantity > 1) {
      cart[index].quantity--;
    } else {
      cart.removeAt(index);
    }

    notifyListeners();
  }


  //TOTAL

  num Total (){
    double totals=0.0;
    for(var item in cart)
    {
      totals+=item.quantity *item.price;
    }
    return totals;
  }


  //BANNER
  Bnner(){
    int banner=0;
    for (var item in cart)

    {
      banner+=item.quantity;
      
    }
    return banner;
    

  }



}