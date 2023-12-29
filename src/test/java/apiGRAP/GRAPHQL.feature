@graphQLTEST
Feature: plan de pruebas asociada a query graphQL

  Scenario Outline: caso de prueba query <nombreCaso>
    Given url 'https://rickandmortyapi.com/graphql'
    When text query =
      """
      query {
  character(id:<numero>)
  {gender}
}
      """
    And request {query : '#(query)'}
    And method POST
    #And match response.data.character.gender == 'Male'
    Then status 200
    Examples:
      | nombreCaso   | numero |
      | genero id 13 | 2      |
      | genero id 3  | 13     |
      | genero id 40 | 40     |
      | genero id 10 | 10     |

  Scenario Outline: caso de prueba query con txt <nombreCaso2>
    Given url 'https://rickandmortyapi.com/graphql'
    When def query = read ('testGRAPH.txt')
    And replace query.num = <num>
    And request {query : '#(query)'}
    And method POST
    #And match response.data.character.gender == 'Male'
    Then status 200
    Examples:
      | nombreCaso2   | num |
      | genero id 13 | 2      |
      | genero id 3  | 13     |
      | genero id 40 | 40     |
      | genero id 10 | 10     |