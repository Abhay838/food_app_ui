import 'package:flutter/material.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/models/product_model.dart';

class CartProvider with ChangeNotifier {
  //private list
  List<CartModel> _carts = [];
  //getter
  List<CartModel> get carts => _carts;
  //setter
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners(); // to rebuild
  }

  //add product
  addCart(MyProductModel productModel) {
    if (productExist(productModel)) {
      //find index
      int index =
          _carts.indexWhere((element) => element.productModel == productModel);
      //increment the quantity if product exits by 1
      _carts[index].quantity = _carts[index].quantity + 1;
    } else {
      //add new item
      _carts.add(CartModel(productModel: productModel, quantity: 1));
      notifyListeners();
    }
  }

//increase the quantity of specific product
  addQuantity(MyProductModel productModel) {
    //find index
    int index =
        _carts.indexWhere((element) => element.productModel == productModel);
    //increase
    carts[index].quantity = _carts[index].quantity + 1;
    notifyListeners();
  }

  //decreases
  reduceQuantity(MyProductModel productModel) {
    //find index
    int index =
        _carts.indexWhere((element) => element.productModel == productModel);
    //increase
    carts[index].quantity = _carts[index].quantity - 1;
    notifyListeners();
  }
  //check if product already exist in cart
  // return true if product exist or false

  productExist(MyProductModel productModel) {
    if (_carts.indexWhere((element) => element.productModel == productModel) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  //calculate totalPrices
  double totalCart() {
    double total = 0;
    for (var i = 0; i < _carts.length; i++) {
      total = total + _carts[i].quantity * _carts[i].productModel.price;
    }
    return total;
  }
}
