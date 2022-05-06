Feature: databases testing
    testing behave-db steps

    Scenario: connect to csv with var 
        Given I connect to db "{{csv_jdbc_url}}" with user "None" and password "None"
        When I wait for 1 seconds
        Then I set "count_num" from the search with "SELECT count(1) FROM csv_datas "
        And  the "{{count_num}}" is not null
        And  the "count_num" value should be "200"


    Scenario: connect to csv with json
        Given I connect to db with json
        """
        {
         "driver_name" : "org.relique.jdbc.csv.CsvDriver",
         "jdbc_url"    : "jdbc:relique:csv:./data",
         "db_user"     : null,
         "db_password" : null,
         "driver_jar_path"  : "./data/csvjdbc-1.0-37.jar"
        }
        """
        When I wait for 1 seconds
        Then I set "count_num2" from the search with "SELECT count(1) FROM csv_datas "
        And  the "{{count_num2}}" is not null
        And  the "count_num2" value should be "200"
