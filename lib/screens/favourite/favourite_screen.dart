import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/favourite/favourite_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favourite List"),
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          switch (state.fetchStatus) {
            case ListStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ListStatus.failure:
              return const Center(child: Text("Something went wrong"));
            case ListStatus.success:
              return ListView.builder(
                itemBuilder: (context, index) {
                  debugPrint("ListStatus.success-->${state.itemList[index].isFavourite}");
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                    child: Card(
                      child: ListTile(
                        title: Text("${state.itemList[index].isFavourite}"),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<FavouriteBloc>().add(FavouriteItem(index:index));
                          },
                          icon: state.itemList[index].isFavourite!?
                          const Icon(Icons.favorite,color:Colors.red):
                          const Icon(Icons.favorite_border_outlined),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.itemList.length,
              );
          }
        },
      ),
    );
  }
}
