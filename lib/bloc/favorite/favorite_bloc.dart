import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_with_bloc/model/favorite_item_model.dart';
import 'package:practice_with_bloc/repository/favorite_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<FavoriteItemModel> favoriteList = [];
  FavoriteRepository repository;

  FavoriteBloc(this.repository) : super(FavoriteState()) {
    on<FatchFavoriteList>(fetchItem); 
    on<FavoriteItem>(_addFavoriteItem); 
  }

  Future<void> fetchItem(
    FatchFavoriteList event,
    Emitter<FavoriteState> emit,
  ) async {
    favoriteList = await repository.fetchItem();
    emit(
      state.copyWith(
        favoriteItemList: List.from(favoriteList),
        listStatus: ListStatus.success,
      ),
    );
  }

  Future<void> _addFavoriteItem(
    FavoriteItem event,
    Emitter<FavoriteState> emit,
  ) async {
    final index= favoriteList.indexWhere((element)=>element.id == event.item.id);
    favoriteList[index] =event.item;

    // favoriteList = await repository.fetchItem();
    emit(
      state.copyWith(
        favoriteItemList: List.from(favoriteList)
      ),
    );
  }
}
