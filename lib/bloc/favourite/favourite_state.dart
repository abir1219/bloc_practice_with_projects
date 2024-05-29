part of 'favourite_bloc.dart';

enum ListStatus { loading, success, failure }

@immutable
class FavouriteState extends Equatable {
  final List<FavouriteModel> itemList;
  final ListStatus fetchStatus;

  const FavouriteState(
      {this.itemList = const [], this.fetchStatus = ListStatus.loading});

  FavouriteState copyWith(
      {List<FavouriteModel>? itemList, ListStatus? fetchStatus}) {
    return FavouriteState(
        itemList: itemList ?? this.itemList,
        fetchStatus: fetchStatus ?? this.fetchStatus);
  }

  @override
  List<Object?> get props => [];
}
