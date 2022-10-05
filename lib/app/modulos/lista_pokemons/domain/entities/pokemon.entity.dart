import '../../../modulos.imports.dart';

class Pokemon {
  final String id;
  final String nome;
  late final String imgURL;

  ///Detalhes do pokemon
  PokemonDetails? details;

  Pokemon({
    required this.id,
    required this.nome,
    required this.details,
  }) {
    imgURL = generateImgURL(id);
  }

  generateImgURL(String id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }
}
