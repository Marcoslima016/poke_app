import '../domain.imports.dart';

abstract class ILoadList {
  Future<List<Pokemon>> call();
}

class LoadList implements ILoadList {
  IPokemonsListRepo repository;
  LoadList({
    required this.repository,
  });

  @override
  Future<List<Pokemon>> call() async {
    return await repository.getPokemons();
  }
  //
}
