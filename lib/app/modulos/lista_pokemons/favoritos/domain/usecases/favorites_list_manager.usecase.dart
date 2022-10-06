import 'package:poke_app/app/modulos/lista_pokemons/favoritos/domain/usecases/add_favorite.usecase.dart';

import '../../../lista_pokemons.imports.dart';
import 'usecases.imports.dart';

abstract class IFavoritosListManager {
  Future<List<Pokemon>> loadList();
  Future adicionarFavorito(Pokemon novoFavorito);
  Future removerFavorito(Pokemon favorite);
}

class FavoritosListManager implements IFavoritosListManager {
  ILoadFavorites usecaseLoadFavorites;
  IAddFavorite usecaseAddFavorite;
  IRemoveFavorite usecaseRemoveFavorite;

  FavoritosListManager({
    required this.usecaseLoadFavorites,
    required this.usecaseAddFavorite,
    required this.usecaseRemoveFavorite,
  });

  //------------------------------------ LOAD LIST ---------------------------------------

  @override
  Future<List<Pokemon>> loadList() async {
    return await usecaseLoadFavorites();
  }

  //----------------------------------- ADD FAVORITO --------------------------------------

  @override
  Future adicionarFavorito(Pokemon novoFavorito) async {
    await usecaseAddFavorite(novoFavorito);
  }

  //--------------------------------- REMOVER FAVORITO -------------------------------------

  @override
  Future removerFavorito(Pokemon favorite) async {
    await usecaseRemoveFavorite(favorite);
  }
}
