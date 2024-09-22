import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskq/core/colors.dart';
import 'package:taskq/core/text_styles.dart';
import 'package:taskq/feature/model/Product_model.dart';

import '../../../core/spacing.dart';

class Card_Widget extends StatelessWidget {
  ProductsModel? product;
  Card_Widget({required this.product, super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          side: BorderSide(width: 1.5.w, color: MyColors.blueColor),
        ),
        color: MyColors.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Stack(
                children: [
                  Positioned(
                      right: 5.w,
                      top: 10.h,
                      child: Icon(
                        Icons.favorite_border,
                        color: Color.fromARGB(255, 2, 1, 0),
                      )),
                  Image.network(
                      fit: BoxFit.contain,
                      height: 100.0.h,
                      width: double.infinity,
                      product?.image ?? 'ddddd'),
                ],
              ),
            ),
            verticalSpace(8),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    product?.title ?? '',
                    style: AppStyles.blueTextStyle16,
                  ),
                  verticalSpace(5),
                  Text(
                    maxLines: 1,
                    product?.description ?? '',
                    style: AppStyles.blueTextStyle16,
                  ),
                  verticalSpace(5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'EGP ', style: AppStyles.blueTextStyle16bold),
                        TextSpan(
                            text: '${product?.price} ',
                            style: AppStyles.blueTextStyle16),
                      ],
                    ),
                  ),
                  // verticalSpace(5),
                  Row(
                    children: [
                      Text(
                        'Rating: ${product?.rating?.rate?.toString() ?? 'N/A'} ',
                        style: AppStyles.blueTextStyle12,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.yellow,
                        size: 20.sp,
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: MyColors.blueColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          color: MyColors.whiteColor,
                          iconSize: 30,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
