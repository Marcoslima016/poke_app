import 'package:poke_app/app/app.imports.dart';

abstract class IPokemonDetailsRepository {
  Future<PokemonDetails> loadDetails(Pokemon pokemon);
}
