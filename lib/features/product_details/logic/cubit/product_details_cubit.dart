import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/constant/table.dart';
import 'package:market/features/product_details/data/models/comments/add_comment_model.dart';
import 'package:market/features/product_details/data/models/rates/add_rate_request_model.dart';
import 'package:market/features/product_details/data/models/rates/product_details_rate_response_model.dart';
import 'package:market/features/product_details/data/models/rates/update_rate_request_model.dart';
import 'package:market/features/product_details/data/repo/product_details_repo.dart';
import 'package:market/features/product_details/logic/cubit/product_details_state.dart';
import 'package:market/market.dart';
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

  // get rate
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

  // add rate

  Future addRate(AddRateRequestModel addRate) async {
    emit(const ProductDetailsState.loadingAddRate());

    final response = await _productDetailsRepo.addRate(addRate);

    response.when(
      success: (data) {
        emit(const ProductDetailsState.successAddRate());
      },
      failure: (message) {
        emit(ProductDetailsState.errorAddRate(errorMessage: message));
      },
    );
  }

  // update rate

  Future updateRate(
      UpdateRateRequestModel rate, String userId, String productId) async {
    emit(const ProductDetailsState.loadingUpdateRate());

    final response = await _productDetailsRepo.updateRate(
      rate: rate,
      userId: userId,
      productId: productId,
    );

    response.when(
      success: (data) {
        emit(const ProductDetailsState.successUpdateRate());
      },
      failure: (message) {
        emit(ProductDetailsState.errorUpdateRate(errorMessage: message));
      },
    );
  }

  // get comments

  Future getComments({required String productId}) async {
    emit(const ProductDetailsState.loadingGetComments());

    final response =
        await _productDetailsRepo.getComments(productId: productId);
    response.when(
      success: (data) {
        emit(ProductDetailsState.successGetComments(data));
      },
      failure: (message) {
        emit(ProductDetailsState.errorGetComments(errorMessage: message));
      },
    );
  }

  // add comment

  Future<void> addComment({
    required String productId,
    required String comment,
  }) async {
    emit(const ProductDetailsState.loadingAddComments());

    final data = await client
        .from(TableHelper.userDataTable)
        .select()
        .eq('id', client.auth.currentUser!.id);
    var name = data[0]['name'];
    final response = await _productDetailsRepo.addComment(
      AddCommentModel(
        comment: comment,
        for_product_id: productId,
        for_user_id: Supabase.instance.client.auth.currentUser!.id,
        user_name: name,
      ),
    );
    response.when(success: (data) {
      emit(const ProductDetailsState.successAddComments());
    }, failure: (message) {
      emit(ProductDetailsState.errorAddComments(errorMessage: message));
    });
  }
}
