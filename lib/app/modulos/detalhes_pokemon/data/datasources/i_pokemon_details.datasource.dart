abstract class IPokemonDetailsDatasource {
  Future<Map<String, dynamic>> loadDetails({required String pokeName});
}
