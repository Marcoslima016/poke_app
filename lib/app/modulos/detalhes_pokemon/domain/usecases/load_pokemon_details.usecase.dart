import '../../../modulos.imports.dart';
import '../domain.imports.dart';

abstract class ILoadPokemonDetails {
  Future<PokemonDetails> call(Pokemon pokemon);
}

class LoadPokemonDetails implements ILoadPokemonDetails {
  IPokemonDetailsRepository repository;

  LoadPokemonDetails({
    required this.repository,
  });

  @override
  Future<PokemonDetails> call(Pokemon pokemon) async {
    return await repository.loadDetails(pokemon);
  }
  //
}
