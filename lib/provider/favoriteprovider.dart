import 'package:flutter/foundation.dart';
import 'package:furniture/data/productdata.dart';

class Favprovider extends ChangeNotifier{
  final List<ProductModel>favorites=[];
   fav(ProductModel product){
    int index=favorites.indexWhere((f)=>f.name==product.name);
    if(index!=-1)
    {
      favorites.indexWhere((f)=>f.name==product.name);
    favorites.removeAt(index);
  
    }
    else{
      favorites.add(product);
    }
    
    notifyListeners();


  }
  bool isfav(ProductModel product){
    return favorites.any(
      (item) => item.image == product.image,
    );

  }

  

}