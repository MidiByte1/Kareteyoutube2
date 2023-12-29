@soapRequest
Feature: plan de prueba orientado a las consultas tipo soap

  Scenario: caso de prueba tipo POST
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    When header Content-Type = 'text/xml'
    And request
      """
      <?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
      <ubiNum>800</ubiNum>
    </NumberToWords>
  </soap:Body>
</soap:Envelope>
     """
    And method POST
    And match response/Envelope/Body/NumberToWordsResponse/NumberToWordsResult == 'eight hundred '
    Then status 200


  Scenario Outline: caso de prueba tipo POST <casoPrueba>
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    When header Content-Type = 'text/xml'
    And request
      """
      <?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
      <ubiNum><num></ubiNum>
    </NumberToWords>
  </soap:Body>
</soap:Envelope>
     """
    And method POST
    And match response/Envelope/Body/NumberToWordsResponse/NumberToWordsResult == '<asercion> '
    #Then status <statusA>
    Examples:
      | casoPrueba            | num   | asercion      |
      | numero 800            | 800   | eight hundred |
      | numero 11             | 11    | eleven        |
      #| numero formato string | "200" | two hundred   |
      #| numero null           | null  | 400     |
      #| numero vacio          |       | 400     |

  Scenario Outline: caso de prueba tipo read xml
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    When header Content-Type = 'text/xml'
    And def bodyx = read ('body.xml')
    And request bodyx
    And method POST
    Examples:
    |num|
    |   2|
    |    800|
    |11     |
    |200    |