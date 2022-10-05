import 'dart:convert';

import '../../../../app.imports.dart';
import '../../lista_pokemons.imports.dart';
import '../favoritos.imports.dart';

class FavoritesListLocalDatasource implements IFavoritesListDatasource {
  ILocalStorageDriver localStorageDriver;

  final String _dbKey = "listaDeFavoritos";

  FavoritesListLocalDatasource({
    required this.localStorageDriver,
  });

  @override
  Future getFavorites() async {
    List dbResult = await localStorageDriver.getList(key: _dbKey);

    if (dbResult == []) return;

    // Map resultMap = json.decode(resultJson);

    // var t = resultJson.map((x) {
    //   return PokemonModel.fromMap(json.decode(x));
    // }).toList();

    // var t = PokemonModel.fromJson(resultJson);

    //--------------------------
    List<Pokemon> favoritesList = [];
    for (String resultJson in dbResult) {
      favoritesList.add(PokemonModel.fromMap(json.decode(resultJson)));
    }
    var p = "";
  }

  @override
  Future addFavorite(Pokemon newFavorite) async {
    // List favoritesList = await localStorageDriver.getList(key: _dbKey);
    List favoritesList = [
      // PokemonModel(nome: "teste2"),
    ];

    PokemonModel newFavoriteModel = PokemonModel.fromEntity(newFavorite);

    favoritesList.add(newFavoriteModel);

    var favoritesListMap = [];
    for (PokemonModel favorite in favoritesList) {
      favoritesListMap.add(favorite.toJson());
    }

    await localStorageDriver.putList(key: _dbKey, list: favoritesListMap);
  }

  // @override
  // Future deleteFavorite() {
  //   // TODO: implement deleteFavorite
  //   throw UnimplementedError();
  // }
  //
}
