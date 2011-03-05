Feature: Jobs

  Scenario: A user can view job listings
    Given I go to the home page
    And there is a job with title "Ninjitsu-practicing, Guitar-playing Hacker at Trying Too Hard Co"
    Then I should see "jobs"
    When I follow "jobs"
    Then I should see "Ninjitsu-practicing, Guitar-playing Hacker at Trying Too Hard Co"

  Scenario: A user can request a job post
    Given I go to the home page
    Then I should see "jobs"
    When I follow "jobs"
    Then I should see "Post a job"
    When I follow "Post a job"
    Then I should see "Job Post Request"
    When I fill in "Name" with "Frank Vogel"
    And I fill in "Email" with "frank.vogel@pacers.com"
    And I fill in "Title" with "Star NBA Player"
    And I fill in "Description" with "An NBA star who actually cares."
    And I press "Send"
    Then I should see "sent successfully"
