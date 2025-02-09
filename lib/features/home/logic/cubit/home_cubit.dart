import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/features/home/data/repos/get_product_repo.dart';
import 'package:market/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getProductRepo) : super(const HomeState.initial());
  final GetProductRepo _getProductRepo;

  // get product method

  void getProducts() async {
    emit(const HomeState.loadingGetProduct());
    final response = await _getProductRepo.getProducts();
    response.when(
      success: (productData) {
        emit(HomeState.successGetProduct(productData));
      },
      failure: (message) {
        emit(HomeState.errorGetProduct(errorMessage: message));
      },
    );
  }
}
