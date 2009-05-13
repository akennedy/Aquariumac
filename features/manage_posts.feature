Feature: Manage Posts
  In order to manage posts
  As a user
  I want to list, create, update, and show posts

  Scenario: List Posts
    Given I have posts titled Post1, Post2
    When I go to the list of posts
    Then I should see 2 posts
    And I should see "Post1"
    And I should see "Post2"

  Scenario: Create New Post
    Given I have no posts
    And I go to the list of posts
    And I follow "New Post"
    And I fill in "Subject" with "Hello World"
    And I fill in "Body" with "This is a new post message."
    When I press "Create Post"
    Then I should see 1 post
    And I should see "Successfully created post."
    And I should see "Hello World"
    And I should see "This is a new post message."

  Scenario: Edit Post
    Given I have post titled TestPost1
    And I go to the list of posts
    And I follow "Edit"
    And I fill in "Subject" with "Hello World"
    And I fill in "Body" with "This is a edit post message."
    When I press "Update Post"
    And I should see "Successfully updated post."
    And I should see "Hello World"
    And I should see "This is a edit post message."


  Scenario: Delete Post
    Given I have post titled TestPost1
    And I go to the list of posts
    When I follow "Remove"
    Then I have no posts
    And I should see "Successfully removed post." 
