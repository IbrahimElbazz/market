import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/features/favorite/data/models/get_fav_model.dart';
import 'package:market/features/favorite/data/repo/fav_repo.dart';
import 'package:market/features/favorite/logic/cubit/fav_state.dart';
import 'package:market/market.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this._favRepo) : super(const FavState.initial());

  final FavRepo _favRepo;
  List<getFavoriteModel> favoriteList = [];
  Future getFavorite() async {
    emit(const FavState.loadingGetVaf());
    final response = await _favRepo.getFav(client.auth.currentUser!.id);
    response.when(
      success: (data) {
        favoriteList.addAll(data);
        emit(FavState.successGetVaf(data));
      },
      failure: (message) {
        emit(FavState.errorGetVaf(errorMessage: message));
      },
    );
  }
}
