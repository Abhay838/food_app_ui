import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class FoodProductItem extends StatelessWidget {
  final MyProductModel productModel;
  const FoodProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 190.h,
          width: 160.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 240,
          width: 160.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: 15 * pi / 180,
                  child: SizedBox(
                    height: 100,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 50.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 10,
                                    blurRadius: 30,
                                  )
                                ]),
                          ),
                        ),
                        Image.asset(
                          productModel.image,
                          height: 100.w,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  productModel.name,
                  style: TextStyle(
                    fontSize: 15,
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
                          size: 22,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          productModel.rate.toString(),
                          style: TextStyle(
                            color: kblack.withOpacity(.5),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: kpink,
                          size: 20,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "${productModel.rate}m",
                          style: TextStyle(
                            color: kblack.withOpacity(.5),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  "\$${(productModel.price).toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kblack,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                cartProvider.addCart(productModel);
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: kblack,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ))
      ],
    );
  }
}
