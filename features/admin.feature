Feature: Admin

  Scenario: An admin can log in
    Given I am signed up as "miles@example.com" with password "rockstar"
    When I go to the sign in page
    Then I should see "Email"
    And I should see "Password"
    When I fill in "Email" with "miles@example.com"
    And I fill in "Password" with "rockstar"
    And I press "Sign in"
    Then I should see "Signed in successfully"

  Scenario: An admin can create a new job
    Given I am logged in as "miles@example.com"
    When I go to the jobs admin page
    Then I should see "Create a New Job"
    When I follow "Create a New Job"
    Then I should see "Title"
    And I should see "Description"
    When I fill in "Title" with "Ninjitsu-practicing, Guitar-playing Hacker at Trying Too Hard Co"
    And I fill in "Description" with "Title says it all. Amirite!?"
    And I press "Save"
    Then I should see "Job was successfully created"
    And I should see "Ninjitsu-practicing, Guitar-playing Hacker at Trying Too Hard Co"
    And I should see "Title says it all. Amirite!?"

  Scenario: An admin can edit a new job
    Given I am logged in as "miles@example.com"
    And there is a job with title "Ninjitsu-practicing, Guitar-playing Hacker at Trying Too Hard Co"
    When I go to the jobs admin page
    Then I should see "Ninjitsu-practicing, Guitar-playing Hacker at Trying Too Hard Co"
    When I follow "edit"
    Then I should see "Title"
    And I should see "Description"
    And I fill in "Description" with "Title says it all. Amirite!?"
    And I press "Save"
    Then I should see "Job was successfully updated"
    And I should see "Ninjitsu-practicing, Guitar-playing Hacker at Trying Too Hard Co"
    And I should see "Title says it all. Amirite!?"
