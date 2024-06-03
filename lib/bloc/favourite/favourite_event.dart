part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteEvent extends Equatable{}

final class FetchItemsEvent extends FavouriteEvent{

  @override
  List<Object?> get props => [];
}

final class FavouriteItem extends FavouriteEvent{
  int index;
  FavouriteItem({this.index = -1});
  @override
  List<Object?> get props => [index];

}
