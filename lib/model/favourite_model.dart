import 'package:equatable/equatable.dart';

class FavouriteModel extends Equatable {
  int? id;
  String? itemName;
  bool? isFavourite;
  bool? isDeleting;

  FavouriteModel(
      {this.id,
      this.itemName,
      this.isFavourite = false,
      this.isDeleting = false});

  FavouriteModel copyWith(
      int? id, String? itemName, bool? isFavourite, bool? isDeleting) {
    return FavouriteModel(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      isFavourite: isFavourite ?? this.isFavourite,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  @override
  List<Object?> get props => [id, itemName, isFavourite, isDeleting];
}
