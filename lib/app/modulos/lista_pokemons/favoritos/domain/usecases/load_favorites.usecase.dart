import '../domain.imports.dart';

abstract class ILoadFavorites {
  Future call();
}

class LoadFavorites implements ILoadFavorites {
  IFavoritesListRepository repository;

  LoadFavorites({
    required this.repository,
  });

  @override
  Future call() async {
    var t = await repository.getFavorites();
    var p = "";
  }
}
