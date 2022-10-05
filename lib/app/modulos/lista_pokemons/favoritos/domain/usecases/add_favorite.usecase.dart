import '../../../lista_pokemons.imports.dart';
import '../domain.imports.dart';

abstract class IAddFavorite {
  Future call(Pokemon newFavorite);
}

class AddFavorite implements IAddFavorite {
  IFavoritesListRepository repository;

  AddFavorite({
    required this.repository,
  });

  @override
  Future call(Pokemon newFavorite) async {
    await repository.addFavorite(newFavorite);
  }
  //
}
