Feature:plan de pruebas GET

  Scenario:caso de pruebas
    Given url 'https://reqres.in/api/users/2'
    When header 'Content-Type' = 'Application/json'
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    When method GET
    And match response.data.id == 2
    Then status 200

  @casoGet
  Scenario Outline: caso de prueba <nombreCaso>
    Given url 'https://reqres.in/api/users/<ID>'
    When header 'Content-Type' = 'Application/json'
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    When method GET
    Then status <estadoHTTP>
    Examples:
      | nombreCaso        | ID | estadoHTTP |
      | caso id 1         | 1  | 200        |
      | caso id 2         | 2  | 200        |
      | caso id 3         | 3  | 200        |
      | caso id not found | 50 | 404        |

  @casoPost
  Scenario Outline:caso de pruebas 2 POST <nombreCaso2>
    Given url 'https://reqres.in/api/users'
    When request {"<name>": "<vname>","<job>": "<vjob>"}
    And method POST
    Then status 201
    Examples:
      | nombreCaso2    | name | vname | job | vjob |
      | name vacio     | name |       | job | QA   |
      | name nulo      | name | null  | job | QA   |
      | name 3 letras  | name | sol   | job | QA   |
      | sin campo name |      |       | job | QA   |

  Scenario:caso de pruebas POST 2
    Given url 'https://reqres.in/api/users'
    When request
    """
    {
    "name": "Bryan",
    "job": "QA"
}
    """
    And method POST
    Then status 201

  Scenario: caso de prueba tipo DELETE
    Given url 'https://reqres.in/api/users/4'
    When method DELETE
    Then status 204