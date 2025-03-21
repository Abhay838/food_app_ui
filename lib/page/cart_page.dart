import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/utils/colors.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import '../widget/cart_tem.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> cartItems = cartProvider.carts.reversed.toList();
    return Scaffold(
      backgroundColor: kbgColor,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: kblack,
                    ),
                  ),
                ),
                Text(
                  'My Cart',
                  style: TextStyle(
                    color: kblack,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...List.generate(
                  cartItems.length,
                  (index) => Container(
                    height: 145.h,
                    width: 360.w,
                    margin: EdgeInsets.only(
                      top: index == 0 ? 30 : 0,
                      right: 25,
                      left: 25,
                      bottom: 30,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        CartTem(
                          cartModel: cartItems[index],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}
