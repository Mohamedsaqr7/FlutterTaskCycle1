import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskq/core/Navigation.dart';
import 'package:taskq/core/colors.dart';
import 'package:taskq/feature/model/Product_model.dart';
import 'package:taskq/feature/view/details_screen.dart';
import 'package:taskq/feature/view_model/home_cubit.dart';
import 'package:taskq/feature/view_model/home_state.dart';

import '../../core/spacing.dart';
import '../../core/text_styles.dart';
import 'component/card_Widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
            child: state is productLoadingState
                ? Center(
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(MyColors.blueColor),
                    ),
                  )
                : GridView.count(
                    childAspectRatio: 9 / 15,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: List.generate(cubit.products.length, (index) {
                      return Material(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () => Navigation.gopush(context,
                              Details_Screen(id: cubit.products[index])),
                          child: Card_Widget(
                            product: cubit.products[index],
                          ),
                        ),
                      );
                    }),
                  ),
          )),
        );
      },
    );
  }
}
