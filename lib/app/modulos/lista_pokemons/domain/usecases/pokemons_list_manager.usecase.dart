import '../entities/entities.imports.dart';
import 'usecases.imports.dart';

/// USECASE 'LIST MANAGER'.
/// - Utilizo o termo 'list manger' para usecases responsaveis pelas
/// acoes gerais relacionadas a uma lista.
/// Normalmente esse usecase é composto de metodos utilizados para manipular uma lista,
/// como por exemplo load, update, delete, etc. Nesse caso, ele precisou conter apenas o metodo load.
abstract class IPokemonsListManager {
  Future<List<Pokemon>> loadList({required List<Pokemon> favoritesList});
}

class PokemonsListManager implements IPokemonsListManager {
  ILoadList usecaseLoadList;

  PokemonsListManager({
    required this.usecaseLoadList,
  });

  //------------------------------------------------ LOAD LIST ------------------------------------------------

  ///Faz o carregamento inicial da lista
  @override
  Future<List<Pokemon>> loadList({required List<Pokemon> favoritesList}) async {
    return await usecaseLoadList(favoritesList: favoritesList);
  }
  //
}
