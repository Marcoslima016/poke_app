import '../../lista_pokemons.imports.dart';

abstract class IFavoritesListDatasource {
  Future getFavorites();
  Future addFavorite(Pokemon newFavorite);
  // Future deleteFavorite();
}
