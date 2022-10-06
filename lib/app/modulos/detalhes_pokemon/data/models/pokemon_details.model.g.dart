// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsModel _$PokemonDetailsModelFromJson(Map<String, dynamic> json) =>
    PokemonDetailsModel(
      json['xdescription'] as String? ?? '',
      json['ydescription'] as String? ?? '',
      json['height'] as String? ?? '',
      json['category'] as String? ?? '',
      json['weight'] as String? ?? '',
      (json['weaknesses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      (json['evolutions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      (json['abilities'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      json['hp'] as num? ?? 0,
      json['attack'] as num? ?? 0,
      json['defense'] as num? ?? 0,
      json['special_attack'] as num? ?? 0,
      json['special_defense'] as num? ?? 0,
      json['speed'] as num? ?? 0,
      json['total'] as num? ?? 0,
      json['male_percentage'] as String?,
      json['female_percentage'] as String?,
      json['cycles'] as String?,
      json['evolvedfrom'] as String?,
      json['reason'] as String?,
      json['base_exp'] as String? ?? '0',
    );

Map<String, dynamic> _$PokemonDetailsModelToJson(
        PokemonDetailsModel instance) =>
    <String, dynamic>{
      'xdescription': instance.xDescription,
      'ydescription': instance.yDescription,
      'height': instance.height,
      'category': instance.category,
      'weight': instance.weight,
      'weaknesses': instance.weaknesses,
      'evolutions': instance.evolutions,
      'abilities': instance.abilities,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'special_attack': instance.specialAttack,
      'special_defense': instance.specialDefense,
      'speed': instance.speed,
      'total': instance.total,
      'male_percentage': instance.genderMalePercentage,
      'female_percentage': instance.genderFemalePercentage,
      'cycles': instance.cycles,
      'evolvedfrom': instance.evolvedFrom,
      'reason': instance.reason,
      'base_exp': instance.baseExp,
    };
