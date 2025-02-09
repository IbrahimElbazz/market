import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/features/product_details/data/models/product_details_response_model.dart';
import 'package:market/features/product_details/data/repo/product_details_repo.dart';
import 'package:market/features/product_details/logic/cubit/product_details_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(
    this._productDetailsRepo,
  ) : super(const ProductDetailsState.initial());

  final ProductDetailsRepo _productDetailsRepo;

  int rates = 0;
  double avgRate = 0;
  int userRates = 0;
  List userRatesList = [];
  double avgUserRate = 0;
  Future<void> getProductDetailsRate(String productId) async {
    emit(const ProductDetailsState.loadingGetProductDetailsRate());

    final response = await _productDetailsRepo.getProductDetailsRate(productId);

    response.when(
      success: (data) {
        avgRate = 0;
        rates = 0;
        avgUserRate = 0;
        userRates = 0;
        userRatesList = [];
        getAvgRate(data);
        getUserRate(data);
        emit(ProductDetailsState.successGetProductDetailsRate(data));
      },
      failure: (error) {
        emit(
          ProductDetailsState.errorGetProductDetailsRate(
            errorMessage: error,
          ),
        );
      },
    );
  }

  void getUserRate(List<ProductDetailsRateResponseModel> data) {
    for (var element in data) {
      if (element.for_user_id ==
          Supabase.instance.client.auth.currentUser!.id) {
        userRates += element.rate!;
        userRatesList.add(userRates);
        avgUserRate = userRates / userRatesList.length;
        log(avgUserRate.toString());
        log('+++++++++++++++++++++++++++++++++++++++++');
      }
    }
  }

  void getAvgRate(List<ProductDetailsRateResponseModel> data) {
    for (var element in data) {
      if (element.rate != null) {
        rates += element.rate!.toInt();
        avgRate = rates / data.length.toInt();
      }
    }
  }
}
