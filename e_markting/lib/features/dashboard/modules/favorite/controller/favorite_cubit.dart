import 'package:bloc/bloc.dart';
import 'package:e_markting/features/dashboard/modules/product/controller/product_cubit.dart';
import 'package:e_markting/features/dashboard/modules/product/model/entity_model/product_model.dart';
import 'package:e_markting/features/dashboard/modules/product/model/repo/database_repo.dart';

import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteStateLoading()) {
    init();
  }

  List<ProductModel> products = [];

  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(FavoriteStateLoading());
    await repo.initDB();

    products = await repo.fetchFavoriteProducts();
    if (products.isEmpty) {
      emit(FavoriteStateEmpty());
    } else {
      emit(FavoriteStateLoaded());
    }
  }

  Future<void> addItemToFavorite(int id, int value) async {
    await repo.updateFavorite(value, id);
    await init();
    await ProductCubit.instance.init();
    emit(FavoriteStateLoaded());
  }

/*  void addItemToCart(int id) {
    repo.updateCart(1, id);
    emit(FavoriteStateLoaded());
  }*/
}
