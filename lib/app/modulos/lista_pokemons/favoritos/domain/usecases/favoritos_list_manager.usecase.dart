import 'usecases.imports.dart';

abstract class IFavoritosListManager {
  Future loadList();
}

class FavoritosListManager implements IFavoritosListManager {
  ILoadFavorites usecaseLoadFavorites;

  FavoritosListManager({
    required this.usecaseLoadFavorites,
  });

  @override
  Future loadList() async {
    var p = "";
    await usecaseLoadFavorites();
  }
}
