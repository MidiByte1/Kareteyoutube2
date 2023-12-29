Feature: token basic and bearer

  Scenario: bearer token
    Given url 'https://api.github.com/user/repos'
    When header Authorization = 'bearer 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'
    And method GET
    Then status 200