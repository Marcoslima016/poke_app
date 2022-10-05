/// Contrato referente ao datasource que será utilizado pelo Repository.
/// Essa camada é abstraida com o objetivo de evitar dependencia entre o projeto e
/// a tecnologia de consulta de dados.
/// Segue alguns exemplos de implementações utilizando diferentes tecnologias:
///  PokemonsListDatasourceREST  *Este é o que vamos utilizar.
///  PokemonsListDatasourceGraphQL
///  PokemonsListDatasourceFirebase
abstract class IPokemonsListDatasource {
  Future<Map> getPokemons();
}
