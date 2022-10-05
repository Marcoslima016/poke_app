import '../../lista_pokemons.imports.dart';

abstract class IFavoritesListDatasource {
  Future<List> getFavorites();
  Future addFavorite(Pokemon newFavorite);
  // Future deleteFavorite();
}
