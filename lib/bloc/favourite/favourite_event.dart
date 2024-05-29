part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteEvent extends Equatable{}

final class FetchItemsEvent extends FavouriteEvent{

  @override
  List<Object?> get props => [];
}
