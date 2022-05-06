Feature: databases testing
    testing behave-db steps

    Scenario: search csv context 
        Given I connect to db "{{csv_jdbc_url}}" with user "None" and password "None"
        When I wait for 1 seconds
        Then I set "count_num" from the search with "SELECT count(1) FROM csv_datas "
        And  the "{{count_num}}" is not null
        And  the "count_num" value should be "200"

