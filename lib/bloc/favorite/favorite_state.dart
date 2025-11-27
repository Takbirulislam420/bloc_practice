part of 'favorite_bloc.dart';

enum ListStatus { loading, success, failure }

class FavoriteState extends Equatable {
  final List<FavoriteItemModel> favoriteItemList;
  final ListStatus listStatus;

  const FavoriteState({
    this.favoriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });


  FavoriteState copyWith({List<FavoriteItemModel>? favoriteItemList,ListStatus? listStatus}){
    return FavoriteState(favoriteItemList: favoriteItemList?? this.favoriteItemList,listStatus:listStatus?? this.listStatus);
  }

  @override
  List<Object> get props => [favoriteItemList,listStatus];
}
