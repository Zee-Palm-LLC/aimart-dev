import 'package:aimart_dev/app/modules/home/controllers/cart_controller.dart';
import 'package:aimart_dev/app/modules/home/models/cart_model.dart';
import 'package:aimart_dev/app/modules/home/views/checkout/checkout.dart';
import 'package:aimart_dev/app/modules/home/widgets/appbar/secondary_appbar.dart';
import 'package:aimart_dev/app/modules/home/widgets/cart/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/constants/constants.dart';
import '../../widgets/buttons/primary_button.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = Get.find<CartController>();
  num totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CartModel>(
        stream: cartController.currentCartStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          CartModel? cartModel = snapshot.data;

          return Scaffold(
            appBar: secondaryAppbar(title: 'Cart'),
            body: cartModel == null
                ? Center(
                    child: Text(
                      "No Items in cart",
                      style: CustomTextStyles.kBold20,
                    ),
                  )
                : ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.h, vertical: 20.h),
                    itemBuilder: ((context, index) {
                      return CartCard(
                        decrementCallback: () async {
                          await cartController.decreaseCartItemQuantity(
                              cartModel.cartItemModel[index].product.productId);
                        },
                        text:
                            cartModel.cartItemModel[index].quantity.toString(),
                        incrementCallback: () async {
                          await cartController.increaseCartItemQuantity(
                              cartModel.cartItemModel[index].product.productId);
                        },
                        cartItemModel: cartModel.cartItemModel[index],
                      );
                    }),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    itemCount: cartModel.cartItemModel.length),
            bottomNavigationBar: Container(
              height: 90.h,
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              color: CustomColors.kWhite,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Total Price",
                            style: CustomTextStyles.kBold12
                                .copyWith(color: CustomColors.kGrey)),
                        SizedBox(height: 10.h),
                        Text("\$${cartModel!.totalAmount}",
                            style: CustomTextStyles.kBold20
                                .copyWith(color: CustomColors.kPrimary)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PrimaryButton(
                        onPressed: () {
                          Get.to(() => CheckOutScreenController());
                        },
                        child:
                            Text("Payment", style: CustomTextStyles.kBold16)),
                  )
                ],
              ),
            ),
          );
        });
  }
}

//Aqib bahi algolia ma data khud hi insert kro ?ya add k function bana 
