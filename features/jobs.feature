Feature: Jobs

  Scenario: A user can view job listings
    Given I am a guest
    And there is an existing job
    When I go to the jobs list
    Then I should see the title for that job
    When I click that job's title
    Then I should see the description for that job

  Scenario: A user can request a job post
    Given I am a guest
    When I fill out a job request form
    And I send the form
    Then I should see that the job request was sent successfully
    # ... And I should receive an email?

  Scenario: A user can edit job they've posted and had published
    Given I am a guest
    And I have a job published
    When I visit the job's edit page from the link in the email
    Then I can edit the job

  Scenario: A user can delete job they've posted and had published
    Given I am a guest
    And I have a job published
    When I visit the job's edit page from the link in the email
    Then I can delete the job
