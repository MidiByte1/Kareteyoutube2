@csv&json
  Feature: test csv y test json
    Scenario Outline:caso de pruebas 2 POST <nombreCaso2>
      Given url 'https://reqres.in/api/users'
      When request {"<name>": "<vname>","<job>": "<vjob>"}
      And method POST
      Then status 201
      Examples:
      |read('test.csv')|
    @casoPost
    Scenario Outline:caso de pruebas read json <nombreCaso2>
      Given url 'https://reqres.in/api/users'
      When def body = read ('body.json')
      And request body
      And method POST
      Then status 201
      Examples:
        | nombreCaso2    | name | vname | job | vjob |
        | name vacio     | name |       | job | QA   |
        | name nulo      | name | null  | job | QA   |
        | name 3 letras  | name | sol   | job | QA   |
        | sin campo name |      |       | job | QA   |