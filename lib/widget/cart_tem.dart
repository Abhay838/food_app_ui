import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/utils/colors.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class CartTem extends StatelessWidget {
  final CartModel cartModel;
  const CartTem({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return SizedBox(
      height: 140.h,
      width: 200.w,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 130.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
              top: -5,
              left: 0,
              child: Transform.rotate(
                angle: 10 * pi / 180,
                child: SizedBox(
                  height: 130.h,
                  width: 130.w,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 100.h,
                          width: 70.w,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: kblack.withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ]),
                        ),
                      ),
                      Image.asset(
                        cartModel.productModel.image,
                        width: 130,
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
            left: 150,
            right: 20,
            top: 20,
            child: Column(
              children: [
                Text(
                  cartModel.productModel.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kblack,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: kyellow,
                          size: 20,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          cartModel.productModel.rate.toString(),
                          style: TextStyle(
                            color: kblack.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
