Feature: Jobs

  Scenario: A user can view job listings
    Given I go to the home page
    And there is a job with title "Ninjitsu-practicing, Guitar-playing Hacker at Trying Too Hard Co"
    Then I should see "jobs"
    When I follow "jobs"
    Then I should see "Ninjitsu-practicing, Guitar-playing Hacker at Trying Too Hard Co"

  Scenario: A user can request a job post
    Given I go to the home page
    When I follow "submit a job"
    And I fill in "Name" with "Frank Vogel"
    And I fill in "Email" with "frank.vogel@pacers.com"
    And I fill in "Title" with "Star NBA Coach"
    And I fill in "Description" with "An NBA coach who actually cares."
    And I press "Send"
    Then I should see "sent successfully"

  Scenario: A user can edit job they've posted and had published
    Given I have had a job post published
    When I visit the job's edit page with my token
    Then I should be able to edit the post

  Scenario: A user can delete job they've posted and had published
    Given I have had a job post published
    When I visit the job's edit page with my token
    Then I should be able to delete the post
