Feature: Manage Blog posts
	In order to make a blog
	As an administrator
	I want to create and manage posts

	Scenario: Admin lists posts in administration
		Given I am logged in
		And I have posts titled Cucumber, Webrat, Vim, Git
		When I go to list of posts in administration
		Then I should see "Cucumber"
		And I should see "Webrat"
		And I should see "Vim"
		And I should see "Git"

	Scenario: Admin creates valid post
		Given I have no posts
		And I am logged in
		And I am on list of posts in administration
		When I follow "New post"
		And I fill in "Title" with "First title"
		And I fill in "Content" with "First content"
		And I press "Create"
		Then I should see "New post created."
		And I should see "First title"
		And I should see "First content"
		And I should have 1 post

	Scenario: Admin created invalid post
		Given I have no posts
		And I am logged in
		And I am on new post in administration
		When I press "Create"
		And I should see "Title can't be blank"
		And I should see "Content can't be blank"

	Scenario: Admin edits post
		Given I have created posts titled Cucumber, Webrat, Vim, Git
		And I am logged in
		And I am on list of posts in administration
		When I follow "Webrat"
		And I follow "Edit post"
		And I fill in "Title" with "New title"
		And I fill in "Content" with "New content"
		And I press "Update"
		Then I should see "Post was successfully updated"
		And I should see "New title"
		And I should see "New content"
		And I should have 4 posts

	Scenario: Admin deletes post
		Given I have created posts titled Cucumber, Webrat, Vim, Git
		And I am logged in
		And I am on list of posts in administration
		And I follow "Webrat"
		And I follow "Delete post"
		When I press "Delete"
		Then I should see "Post was successfully deleted"
		And I should not see "Webrat"
		And I should have 3 posts