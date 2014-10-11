Feature: Creating and modifying articles
  In order to add new article
  As a writer
  I want to create new article

  Scenario: Creating new article
    Given I go to dashboard article page
    When I create new article
    Then I should see it at index page
