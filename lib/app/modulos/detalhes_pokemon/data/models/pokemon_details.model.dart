import '../../domain/entities/entities.imports.dart';

class PokemonDetailsModel extends PokemonDetails {
  PokemonDetailsModel({required String description}) : super(description: description);

  //FROM JSON
  factory PokemonDetailsModel.fromMap(Map<String, dynamic> json) {
    return PokemonDetailsModel(
      description: json['description'],
    );
  }
}
