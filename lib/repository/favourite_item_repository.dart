
import '../model/favourite_model.dart';

class FavouriteItemRepository {

  Future<List<FavouriteModel>> fetchItems() async {
    Future.delayed(const Duration(seconds: 3));
    return generateList(20);
  }

  List<FavouriteModel> generateList(int length) {
    return List.generate(length,
        (index) => FavouriteModel(id: index, itemName: "Item ${index + 1}"));
  }
}
