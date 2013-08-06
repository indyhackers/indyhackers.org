Feature: Admin

  Scenario: An admin can log in
    Given I am an admin
    When I attempt to login
    Then I should be signed in successfully

  # First, probably should be a separate feature
  Scenario: An admin can create a new job
    Given I am logged in as an admin
    When I fill out and submit the new job form
    Then I see the saved job

  # First, probably should be a separate feature
  Scenario: An admin can edit a new job
    Given I am logged in as an admin
    When I edit an existing job
    Then I see the updated job
