import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/entities.imports.dart';

part 'pokemon_details.model.g.dart';

@JsonSerializable()
class PokemonDetailsModel {
  PokemonDetailsModel(
    // this.name,
    // this.id,
    // this.imageUrl,
    this.xDescription,
    this.yDescription,
    this.height,
    this.category,
    this.weight,
    // this.types,
    this.weaknesses,
    this.evolutions,
    this.abilities,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.total,
    this.genderMalePercentage,
    this.genderFemalePercentage,
    // this.genderless,
    this.cycles,
    // this.eggGroups,
    this.evolvedFrom,
    this.reason,
    this.baseExp,
  );

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) => _$PokemonDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailsModelToJson(this);

  // @JsonKey(required: true, disallowNullValue: true)
  // final String name;

  // @JsonKey(required: true, disallowNullValue: true)
  // final String id;

  // @JsonKey(required: true, name: 'imageurl', disallowNullValue: true)
  // final String imageUrl;

  @JsonKey(name: 'xdescription', defaultValue: '')
  final String xDescription;

  @JsonKey(name: 'ydescription', defaultValue: '')
  final String yDescription;

  @JsonKey(defaultValue: '')
  final String height;

  @JsonKey(defaultValue: '')
  final String category;

  @JsonKey(defaultValue: '')
  final String weight;

  // @JsonKey(name: 'typeofpokemon', required: true, disallowNullValue: true)
  // final List<String> types;

  @JsonKey(defaultValue: [])
  final List<String> weaknesses;

  @JsonKey(defaultValue: [])
  final List<String> evolutions;

  @JsonKey(defaultValue: [])
  final List<String> abilities;

  @JsonKey(defaultValue: 0)
  final num hp;

  @JsonKey(defaultValue: 0)
  final num attack;

  @JsonKey(defaultValue: 0)
  final num defense;

  @JsonKey(name: 'special_attack', defaultValue: 0)
  final num specialAttack;

  @JsonKey(name: 'special_defense', defaultValue: 0)
  final num specialDefense;

  @JsonKey(defaultValue: 0)
  final num speed;

  @JsonKey(defaultValue: 0)
  final num total;

  @JsonKey(name: 'male_percentage')
  final String? genderMalePercentage;

  @JsonKey(name: 'female_percentage')
  final String? genderFemalePercentage;

  // @JsonKey(required: true, disallowNullValue: true)
  // final num genderless;

  @JsonKey()
  final String? cycles;

  // @JsonKey(name: 'egg_groups')
  // final String? eggGroups;

  @JsonKey(name: 'evolvedfrom')
  final String? evolvedFrom;

  @JsonKey()
  final String? reason;

  @JsonKey(name: 'base_exp', defaultValue: '0')
  final String baseExp;

  //TO ENTITY
  static toEntity(PokemonDetailsModel detailsModel) {
    return PokemonDetails(
      // detailsModel.name,
      // detailsModel.id,
      // detailsModel.imageUrl,
      detailsModel.xDescription,
      detailsModel.yDescription,
      detailsModel.height,
      detailsModel.category,
      detailsModel.weight,
      // detailsModel.types,
      detailsModel.weaknesses,
      detailsModel.evolutions,
      detailsModel.abilities,
      detailsModel.hp,
      detailsModel.attack,
      detailsModel.defense,
      detailsModel.specialAttack,
      detailsModel.specialDefense,
      detailsModel.speed,
      detailsModel.total,
      detailsModel.genderMalePercentage,
      detailsModel.genderFemalePercentage,
      // detailsModel.genderless,
      detailsModel.cycles,
      // detailsModel.eggGroups,
      detailsModel.evolvedFrom,
      detailsModel.reason,
      detailsModel.baseExp,
    );
  }

  //TO ENTITY
  static fromEntity(PokemonDetails detailsEntity) {
    return PokemonDetailsModel(
      // detailsEntity.name,
      // detailsEntity.id,
      // detailsModel.imageUrl,
      detailsEntity.xDescription,
      detailsEntity.yDescription,
      detailsEntity.height,
      detailsEntity.category,
      detailsEntity.weight,
      // detailsModel.types,
      detailsEntity.weaknesses,
      detailsEntity.evolutions,
      detailsEntity.abilities,
      detailsEntity.hp,
      detailsEntity.attack,
      detailsEntity.defense,
      detailsEntity.specialAttack,
      detailsEntity.specialDefense,
      detailsEntity.speed,
      detailsEntity.total,
      detailsEntity.genderMalePercentage,
      detailsEntity.genderFemalePercentage,
      // detailsModel.genderless,
      detailsEntity.cycles,
      // detailsModel.eggGroups,
      detailsEntity.evolvedFrom,
      detailsEntity.reason,
      detailsEntity.baseExp,
    );
  }
}
