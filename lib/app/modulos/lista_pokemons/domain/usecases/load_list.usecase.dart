import '../domain.imports.dart';

abstract class ILoadList {
  Future<List<Pokemon>> call({required List<Pokemon> favoritesList});
}

class LoadList implements ILoadList {
  IPokemonsListRepo repository;
  LoadList({
    required this.repository,
  });

  @override
  Future<List<Pokemon>> call({required List<Pokemon> favoritesList}) async {
    List<Pokemon> repoResult = await repository.getPokemons();
    repoResult = await _identificarFavoritos(favoritos: favoritesList, repoResult: repoResult);
    return repoResult;
  }

  ///Rece a lista recuperada na requisição, e identifica quais items devem ser marcados como favoritos.
  Future<List<Pokemon>> _identificarFavoritos({required List<Pokemon> repoResult, required List<Pokemon> favoritos}) async {
    for (Pokemon itemRepo in repoResult) {
      for (Pokemon itemFavorito in favoritos) {
        if (itemRepo.nome == itemFavorito.nome) {
          itemRepo.isFavorite = true;
        }
      }
    }
    return repoResult;
  }
  //
}
