import 'package:poke_app/app/modulos/lista_pokemons/favoritos/domain/usecases/add_favorite.usecase.dart';

import '../../../lista_pokemons.imports.dart';
import 'usecases.imports.dart';

abstract class IFavoritosListManager {
  Future loadList();
  Future adicionarFavorito(Pokemon novoFavorito);
}

class FavoritosListManager implements IFavoritosListManager {
  ILoadFavorites usecaseLoadFavorites;
  IAddFavorite usecaseAddFavorite;

  FavoritosListManager({
    required this.usecaseLoadFavorites,
    required this.usecaseAddFavorite,
  });

  @override
  Future loadList() async {
    var p = "";
    await usecaseLoadFavorites();
  }

  Future adicionarFavorito(Pokemon novoFavorito) async {
    await usecaseAddFavorite(novoFavorito);
  }
}
