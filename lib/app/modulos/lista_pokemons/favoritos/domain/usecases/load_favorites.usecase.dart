import '../../../lista_pokemons.imports.dart';
import '../domain.imports.dart';

abstract class ILoadFavorites {
  Future<List<Pokemon>> call();
}

class LoadFavorites implements ILoadFavorites {
  IFavoritesListRepository repository;

  LoadFavorites({
    required this.repository,
  });

  @override
  Future<List<Pokemon>> call() async {
    return await repository.getFavorites();
  }
}
