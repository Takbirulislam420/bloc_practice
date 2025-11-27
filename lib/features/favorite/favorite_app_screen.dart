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
    super.initState();
    context.read<FavoriteBloc>().add(FatchFavoriteList()); 
    // Or FetchFavoriteList() based on your naming
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {

            switch (state.listStatus) {

              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());

              case ListStatus.failure:
                return const Center(child: Text("Something went wrong"));

              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favoriteItemList.length,
                  itemBuilder: (context, index) {

                    final item = state.favoriteItemList[index];

                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: item.isFavorite,
                          onChanged: (value) {
                            final updatedItem = FavoriteItemModel(
                              id: item.id,
                              value: item.value,
                              isFavorite: value ?? false,
                            );

                            context.read<FavoriteBloc>().add(
                              FavoriteItem(item: updatedItem),
                            );
                          },
                        ),

                        title: Text(item.value.toString()),

                        trailing: IconButton(
                          onPressed: () {
                            final updatedItem = FavoriteItemModel(
                              id: item.id,
                              value: item.value,
                              isFavorite: !item.isFavorite,
                            );

                            context.read<FavoriteBloc>().add(
                              FavoriteItem(item: updatedItem),
                            );
                          },
                          icon: Icon(
                            item.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: item.isFavorite ? Colors.red : null,
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
