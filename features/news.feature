Feature: Looking into articles page
	In order to read latest articles
	As a page visitor
	I want to see articles list

	Scenario: Reading latest article
		Given I go to articles page
		When I click first title
		Then I can read its content
