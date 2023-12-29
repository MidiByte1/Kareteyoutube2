@token
  Feature: getToken
    @getToken
    Scenario: Obtener token para consumir
      * configure connectTimeout = 120000
      * configure readTimeout = 120000
      * url 'https://seguridad.test.uat.cl'
      * header 'Content-Type' = 'Application/'x-www-form-urlencode'
      * form field grand_type = 'password'
      * form field client_id = 'ID'
      * form field cliente_secret = 'secret'
      * form field username = 'user'
      * form field password = 'password'
      * method POST
      * status 200
      * match responseType == 'json'
