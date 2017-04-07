Feature: Wallaces Astonishing Adventure in Contriboard

Scenario: Wallace opens computer
  Given I navigate to "http://172.17.0.1:80"
  Then I should see page title as "Contriboard"

Scenario Outline: Wallace invalid login
  Given element having name "email" should be present
    And element having name "password" should be present
  When I enter "<user>" into input field having name "email"
    And I enter "<pass>" into input field having name "password"
    And I click on element having class "btn-primary"
  Then I navigate to "http://172.17.0.1:80/login"

  Examples:
    | user | pass |
    | invalid@test.com | Invalid1 |
    | invalid@test.com | |
    |  | Invalid1  |
    |  |  |

Scenario: Register 1/2 Navigate to Register
   Given element having xpath "//button[@class='btn-secondary']" should have text as "Register"
   When I click on element having xpath "//button[@class='btn-secondary']"
   Then element having xpath "//input[@type='email']" should be present
     And element having xpath "//input[@type='password']" should be present
     And element having xpath "//input[@name='passwordAgain']" should be present

Scenario: Register 2/2 Fill register information
   Given element having xpath "//input[@type='email']" should be present
     And element having xpath "//input[@type='password']" should be present
     And element having xpath "//input[@name='passwordAgain']" should be present
   When I clear input field having xpath "//input[@type='email']"
     And I clear input field having xpath "//input[@type='password']"
     And I clear input field having xpath "//input[@name='passwordAgain']"
     And I enter "wallace.coleman@test.com" into input field having xpath "//input[@type='email']"
     And I enter "wallacecoleman" into input field having xpath "//input[@type='password']"
     And I enter "wallacecoleman" into input field having xpath "//input[@name='passwordAgain']"
     And I click on element having xpath "//input[@class='btn-primary']"
   Then I wait 60 seconds for element having xpath "//div[@class='view view-workspace']" to enable 

Scenario: Wallace ReLogin
   Given element having xpath "//form[@class='form']" should be present
   When I clear input field having xpath "//input[@type='email']"
     And I clear input field having xpath "//input[@type='password']"
     And I enter "wallace.coleman@test.com" into input field having xpath "//input[@type='email']"
     And I enter "wallacecoleman" into input field having xpath "//input[@type='password']"
     And I click on element having xpath "//input[@class='btn-primary']"
   Then I wait 60 seconds for element having xpath "//div[@class='view view-workspace']" to enable

Scenario: Wallace explores part 1
   Given I should see page title as "Contriboard"
   When I click on element having xpath "//div[@class='avatar online']"
     And element having xpath "//ul[@class='dropdown options']" should be present
     And I click on element having xpath "//li[@id='options-sign-out']"
   Then I wait 60 seconds for element having xpath "//form[@class='form']" to enable
     And I should see page title as "Contriboard" 

Scenario: Wallace ReLogin
   Given element having xpath "//form[@class='form']" should be present
   When I enter "wallace.coleman@test.com" into input field having xpath "//input[@type='email']"
     And I enter "wallacecoleman" into input field having xpath "//input[@type='password']"
     And I click on element having xpath "//input[@class='btn-primary']"
   Then I wait 60 seconds for element having xpath "//div[@class='view view-workspace']" to enable

Scenario: Wallace Explores Part 2
   Given element having xpath "//div[@class='view view-workspace']" should be present
   When I click on element having xpath "//span[@class='fa fa-fw fa-plus']"
     And I click on element having xpath "//span[@class='fa fa-fw fa-plus']"
     And I click on element having xpath "//span[@class='fa fa-fw fa-plus']"
   Then element having xpath "//div[@class='view view-workspace']" should be present

Scenario: Wallace Tests help 1 : Open board
   Given element having xpath "//div[@class='view view-workspace']" should be present
   When I click on element having xpath "//html/body/div/div/div[2]/div[2]/div[1]/div"
   Then element having xpath "//div[@class='board']" should be present

Scenario: Wallace Tests help 2 : Open Help
   Given element having xpath "//div[@class='board']" should be present
   When I click on element having xpath "//span[@class='fa fa-fw fa-question']"
   Then element having xpath "//div[@class='infospace']" should be present

Scenario: Wallace Tests help 3 : Change help slides
# TODO Change help slides   

Scenario: Wallace Tests help 4 : Close help
   Given element having xpath "//div[@class='infospace']" should be present
   When I click on element having xpath "//span[@class='fa fa-fw fa-times']"
   Then element having xpath "//div[@class='infospace']" should not be present

Scenario: Wallace Tests help 5 : Close board
   Given element having xpath "//div[@class='board']" should be present
   When I click on element having xpath "//span[@class='fa fa-fw fa-arrow-left']"
   Then element having xpath "//div[@class='content']" should be present 

Scenario: Wallace Tries Board Buttons
   Given element having xpath "//html/body/div/div/div[2]/div[4]/div[3]/div[1]/span" should be present
   When I click on element having xpath "//html/body/div/div/div[2]/div[4]/div[3]/div[1]/span"
     And I wait 2 seconds for element having xpath "//form[@class='dialog dialog-remove-board']" to enable
     And I click on element having xpath "//button[@class='btn-danger']"

Scenario: Wallace Edits Board 1 : Name board
   Given I click on element having xpath "//html/body/div/div/div[2]/div[3]/div[3]/div[2]/span"
   When I wait 2 seconds for element having xpath "//form[@class='dialog dialog-edit-board']" to enable
     And I enter "Wallaces Super Awesome Board" into input field having xpath "//input[@name='board-name']"
   
Scenario Outline: Wallace Edits board - Change background
   Given element having xpath "//form[@class='dialog dialog-edit-board']" should be present
   
   Examples:
     | index |
     | 1 |
     | 2 |
     | 3 |
     | 4 |
     | 5 |
     | 6 |
     | 7 |
     | 8 |
     | 0 |

Scenario: Wallace Sets Background and clicks cancel
   Given element having xpath "//form[@class='dialog dialog-edit-board']" should be present
   When I click on element having xpath "//div[@class='dialog-overlay']"
   Then element having xpath "//form[@class='dialog dialog-edit-board']" should not be present

Scenario: Wallace Edits board again
   Given I click on element having xpath "//html/body/div/div/div[2]/div[3]/div[3]/div[2]/span"
   When I wait 2 seconds for element having xpath "//form[@class='dialog dialog-edit-board']" to enable
     And I enter "Wallaces Board" into input field having xpath "//input[@name='board-name']"
     And I click on element having xpath "//button[@class='btn-primary']"
   Then element having xpath "//form[@class='dialog dialog-edit-board']" should not be present

Scenario: Wallace Opens a board
   Given element having xpath "//div[@class='view view-workspace']" should be present
   When I click on element having xpath "//html/body/div/div/div[2]/div[2]/div[1]/div"
   Then element having xpath "//div[@class='board']" should be present

Scenario: Wallace Explores part 3 - Click Magnet On
   Given element having xpath "//div[@class='board']" should be present
   When I click on element having xpath "//span[@class='fa fa-fw fa-magnet']"

Scenario: Walalce Explores part 3 - Click Globe On
   Given element having xpath "//div[@class='board']" should be present
   When I click on element having xpath "//span[@class='fa fa-fw fa-globe']"

Scenario: Wallace Explores part 3 - Click Magnet Off
   Given element having xpath "//div[@class='board']" should be present
   When I click on element having xpath "//span[@class='fa fa-fw fa-magnet']"

Scenario: Wallace Explores part 3 - Click Globe Off
   Given element having xpath "//div[@class='board']" should be present
   When I click on element having xpath "//span[@class='fa fa-fw fa-globe']"

Scenario: Wallace Explores part 3 - Click Edit Board From Board
   Given I wait 2 seconds for element having xpath "//div[@class='controls']" to enable
   When I click on element having xpath "//span[@class='fa fa-fw fa-pencil']"
   Then I wait 2 seconds for element having xpath "//form[@class='dialog dialog-edit-board']" to enable

Scenario: Wallace Changes wrong board name
   Given element having xpath "//input[@name='board-name']" should be present
   When I enter "Wallace Is Awesome" into input field having xpath "//input[@name='board-name']"
     And I click on element having xpath "//button[@class='btn-primary']"
   Then element having xpath "//form[@class='dialog dialog-edit-board']" should not be present

Scenario Outline: Wallace Creates and moves tickets
   Given element having xpath "//div[@class='board']" should be present
   When I double click on element having xpath //div[@class='board']
   Then I wait 2 seconds for element having xpath "//div[@class="ticket"]"   

   Examples:
     | x | y | xmove | ymove |
     |   |   |   |   |
     |   |   |   |   |
|   |   |   |   |
|   |   |   |   |
|   |   |   |   |

Scenario: Wallace Tries magnet

Scenario: Wallace Creates and moves new tickets

Scenario: Wallace Learns to edit ticket

Scenario: Wallace Edits tickes

Scenario: Wallace Deletes obsolete tickets

Scenario: Wallace Closes board

Scenario: Wallace Checks the board

Scenario: Wallace Is done
