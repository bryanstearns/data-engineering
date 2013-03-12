
Feature: Data upload
  In order to lead our new subsidiary into the modern era of relational databases
  I should be able to upload legacy data

  Scenario: Visiting the upload form
    When I visit the new-upload page
    Then I should see a form for uploading

  Scenario: Submitting data
    When I upload a datafile
    Then I should see the total gross revenue
