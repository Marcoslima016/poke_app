import '../../../lista_pokemons.imports.dart';

abstract class IRemoveFavorite {
  Future call(Pokemon favorite);
}

class RemoveFavorite implements IRemoveFavorite {
  IFavoritesListRepository repository;

  RemoveFavorite({
    required this.repository,
  });

  @override
  Future call(Pokemon favorite) async {
    favorite.isFavorite = false;
    await repository.removeFavorite(favorite);
  }
}
