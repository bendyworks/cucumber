Feature: Cucumber --work-in-progress switch with no @wip tags in project
  In order to ensure that cucumber works correctly when specifying a tag that is not in the project
  Developers should be able to run cucumber in a mode that
            - will not fail when unused tags are specified

  Background: A passing feature
    Given a standard Cucumber project directory structure
    Given a file named "features/passing.feature" with:
      """
      Feature: Passing
        @passing
        Scenario: Passing
          Given a passing step
      """
    And a file named "features/step_definitions/steps.rb" with:
      """
      Given /^a passing step$/ do
      end
      """

  Scenario: Pass with @wip tag specified
    When I run cucumber -q -w -t @wip
    Then STDERR should be empty
    Then it should pass with
      """
      0 scenarios
      0 steps
      
      The --wip switch was used, so the failures were expected. All is good.

      """
