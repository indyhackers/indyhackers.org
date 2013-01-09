Feature: Home Page

  Scenario: A user visits the home page of the site and sees a short news update and the calendar
    Given I go to the home page
    Then I should see an "announcement" section
    And I should see "indy hackers' calendar"
