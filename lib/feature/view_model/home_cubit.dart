import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskq/core/Network/Diohelper.dart';
import 'package:taskq/core/Network/Endpoint.dart';
import 'package:taskq/feature/model/Product_model.dart';
import 'package:taskq/feature/view_model/home_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(homePageInitState());

  static HomePageCubit get(context) => BlocProvider.of(context);

  List<ProductsModel> products = [];

  Future<void> getProducts() async {
    emit(productLoadingState());
    try {
      final response = await DioHelper.getData(url: EndPoint.products);
      debugPrint(response.data.toString());

      products.clear();
      for (var item in response.data) {
        products.add(ProductsModel.fromJson(item));
      }

      emit(productSuccessState());
    } catch (error) {
      if (error is DioException) {
        if (error.response?.statusCode == 401) {
          emit(UnauthenticatedState());
        }
           else {
            debugPrint(error.response?.data.toString());
            emit(productErrorState(
                error.response?.data?.toString() ?? 'Error fetching products'));
          }
        } else {
          debugPrint(error.toString());
          emit(productErrorState('Unexpected error occurred'));
      }
    }
  }
}
