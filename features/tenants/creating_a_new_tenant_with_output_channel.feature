Feature: Adding a new tenant with output channel
  In order to publish content to multiple channels
  As a HTTP Client
  I want to add a new tenant via API

  Scenario: Adding a new tenant with Wordpress output channel
    Given I am authenticated as "test.user"
    When I add "Content-Type" header equal to "application/json"
    And I send a "POST" request to "/api/v2/tenants/" with body:
     """
      {
          "domainName": "example.com",
          "name": "Example tenant",
          "subdomain": "tenant1",
          "outputChannel": {
            "type": "wordpress",
            "config": {
              "url": "http://api.wordpress.com",
              "authorizationKey": "private key"
            }
          }
      }
    """
    Then the response status code should be 201
    And the JSON node "output_channel.type" should be equal to "wordpress"
    And the JSON node "output_channel.config.url" should be equal to "http://api.wordpress.com"
    And the JSON node "output_channel.config.authorizationKey" should be equal to "private key"

  Scenario: Adding a new tenant with fake type of output channel
    Given I am authenticated as "test.user"
    When I add "Content-Type" header equal to "application/json"
    And I send a "POST" request to "/api/v2/tenants/" with body:
     """
      {
          "domainName": "example.com",
          "name": "Example tenant",
          "subdomain": "tenant1",
          "outputChannel": {
            "type": "fake",
            "config": {
              "url": "http://api.wordpress.com",
              "authorizationKey": "private key"
            }
          }
      }
    """
    Then the response status code should be 400

  Scenario: Adding a new tenant without output channel
    Given I am authenticated as "test.user"
    When I add "Content-Type" header equal to "application/json"
    And I send a "POST" request to "/api/v2/tenants/" with body:
     """
      {
          "domainName": "example2.com",
          "name": "Example tenant2"
      }
    """
    Then the response status code should be 201
    And the JSON node "output_channel" should be null
