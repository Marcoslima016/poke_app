import '../../../../app.imports.dart';
import '../favoritos.imports.dart';

class FavoritesListLocalDatasource implements IFavoritesListDatasource {
  ILocalStorageDriver localStorageDriver;

  // final String _dbKey = "listaDeFavoritos";

  FavoritesListLocalDatasource({
    required this.localStorageDriver,
  });

  @override
  Future getFavorites() async {
    var t = await localStorageDriver.getList(key: "");
    var p = "";
  }
  //
}
