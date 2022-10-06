import '../../../modulos.imports.dart';

class Pokemon {
  final String id;
  final String nome;
  late final String imgURL;
  bool isFavorite;

  ///Detalhes do pokemon
  PokemonDetails? details;

  Pokemon({
    required this.id,
    required this.nome,
    required this.details,
    required this.isFavorite,
  }) {
    imgURL = generateImgURL(id);
  }

  generateImgURL(String id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    // return 'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/$id.svg';
  }
}
