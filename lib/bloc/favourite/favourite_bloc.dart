import 'package:bloc/bloc.dart';
import 'package:bloc_practice/model/favourite_model.dart';
import 'package:bloc_practice/repository/favourite_item_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'favourite_event.dart';

part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteItemRepository favouriteItemRepository;
  List<FavouriteModel> listItems = [];

  FavouriteBloc(this.favouriteItemRepository) : super(const FavouriteState()) {
    on<FetchItemsEvent>(fetchFavItems);
    on<FavouriteItem>(favouriteChange);
  }

  void fetchFavItems(
      FetchItemsEvent event, Emitter<FavouriteState> emit) async {
    listItems = await favouriteItemRepository.fetchItems();
    emit(state.copyWith(itemList: listItems, fetchStatus: ListStatus.success));
  }

  void favouriteChange(
      FavouriteItem event, Emitter<FavouriteState> emit) {
    //final index = listItems.indexWhere((element) => element.id == listItems[event.index].id);
    //debugPrint("Index===>$index");
    listItems[event.index].isFavourite = listItems[event.index].isFavourite! ? false : true;

    emit(state.copyWith(
        itemList: List.from(listItems),
        fetchStatus: ListStatus.success));
  }
}
