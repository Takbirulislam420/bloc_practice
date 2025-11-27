part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FatchFavoriteList extends FavoriteEvent{}

// ignore: must_be_immutable
class FavoriteItem extends FavoriteEvent{
   FavoriteItemModel item;
   FavoriteItem({required this.item});
}
