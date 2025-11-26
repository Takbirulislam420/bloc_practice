import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_with_bloc/bloc/favorite/favorite_bloc.dart';
import 'package:practice_with_bloc/model/favorite_item_model.dart';

class FavoriteAppScreen extends StatefulWidget {
  const FavoriteAppScreen({super.key});

  @override
  State<FavoriteAppScreen> createState() => _FavoriteAppScreenState();
}

class _FavoriteAppScreenState extends State<FavoriteAppScreen> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(FatchFavoriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return CircularProgressIndicator();
              case ListStatus.failure:
                return CircularProgressIndicator();
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favoriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favoriteItemList[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            FavoriteItemModel itemModel = FavoriteItemModel(
                              id: item.id,
                              value: item.value,
                              isFavorite: item.isFavorite ? false : true,
                            );
                            context.read<FavoriteBloc>().add(
                              FavoriteItem(item: itemModel),
                            );
                          },
                          icon: Icon(
                            item.isFavorite
                                ? Icons.favorite_border
                                : Icons.favorite,
                          ),
                        ),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
