import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/page/cart_page.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widget/food_product_item.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String category = '';
  List<MyProductModel> productModel = [];

  void filterProduct({required String selectedCategory}) {
    setState(() {
      category = selectedCategory;
      productModel = myProductModel
          .where(
            (element) =>
                element.category.toLowerCase() ==
                selectedCategory.toLowerCase(),
          )
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (categoriesList.isNotEmpty) {
      category = categoriesList[0].name;
      filterProduct(selectedCategory: category);
    }
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Your Location",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: kblack,
                          size: 20,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: korange,
                          size: 20,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "Nabin Nepal",
                          style: TextStyle(
                            fontSize: 16,
                            color: kblack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.search,
                      color: kblack,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: kblack,
                        ),
                      ),
                      cartProvider.carts.isNotEmpty
                          ? Positioned(
                              right: 2,
                              top: -3,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const CartPage(),
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    color: Color(0xfff95f60),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    cartProvider.carts.length.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ))
                          : Container(),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Text(
            "Let's finds the best food around you",
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: -.5,
              color: kblack,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Find by Category",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: kblack,
                ),
              ),
              const Text(
                "See all",
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                categoriesList.length,
                (index) => GestureDetector(
                  onTap: () {
                    filterProduct(selectedCategory: categoriesList[index].name);
                  },
                  child: Container(
                    height: 105.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: category == categoriesList[index].name
                          ? Border.all(width: 2.5, color: korange)
                          : Border.all(color: Colors.white),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              height: 30.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kblack.withOpacity(0.6),
                                      offset: const Offset(0, 10),
                                      blurRadius: 13,
                                      spreadRadius: 6,
                                    )
                                  ]),
                            ),
                            Image.asset(
                              categoriesList[index].image,
                              width: 50.w,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          categoriesList[index].name,
                          style: TextStyle(
                            color: kblack,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "Result (${productModel.length})",
            style: TextStyle(
              letterSpacing: -.2,
              fontWeight: FontWeight.bold,
              color: kblack.withOpacity(0.6),
            ),
          ),
        ),
        //SizedBox(height: 10.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              ...List.generate(
                productModel.length,
                (index) => Padding(
                  padding: index == 0
                      ? EdgeInsets.only(left: 15.w, right: 15.w)
                      : const EdgeInsets.only(right: 15),
                  child: FoodProductItem(productModel: productModel[index]),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
