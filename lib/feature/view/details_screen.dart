import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskq/core/colors.dart';
import 'package:taskq/core/spacing.dart';
import 'package:taskq/core/text_styles.dart';

class Details_Screen extends StatelessWidget {
  dynamic id;
  Details_Screen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: MyColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    '${id.title}',
                    style: AppStyles.blueTextStyle20bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColors.blueColor),
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white),
                  width: 400.w,
                  height: 260.h,
                  child: Image.network(
                    height: 200,
                    '${id.image}',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                verticalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        '${id.category}',
                        style: AppStyles.blueTextStyle16bold,
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            'EGP${id.price}',
                            style: AppStyles.blueTextStyle16bold,
                          ),
                          verticalSpace(10),
                        ],
                      )
                    ]),
                    verticalSpace(10),
                    Text(
                      'Details ',
                      style: AppStyles.blueTextStyle20bold,
                    ),
                    verticalSpace(5),
                    Text(
                        style: AppStyles.blueTextStyle16,
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        '${id.description}'),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Rating: ',
                              style: AppStyles.blueTextStyle16bold),
                          TextSpan(
                              style: AppStyles.blueTextStyle16,
                              text:
                                  "${id?.rating?.rate?.toString() ?? 'N/A'} "),
                          WidgetSpan(
                            child: Icon(
                              Icons.star_rate_rounded,
                              color: Color.fromARGB(255, 245, 223, 23),
                              size: 20.sp,
                            ),
                          ),
                          WidgetSpan(child: horizontalSpace(140)),
                          TextSpan(
                              text: "reviews:",
                              style: AppStyles.blueTextStyle16bold),
                          TextSpan(
                              text: ' ${id?.rating?.count?.toString() ?? '0'}',
                              style: AppStyles.blueTextStyle16),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
