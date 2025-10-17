

*** Settings ***
Library    OperatingSystem
//Library    Collections
Library    BuiltIn
Library    String
Library    DateTime
Library    Process
Library    ExcelLibrary
Library    CSVLibrary
// Documentation    To read data from a CSV file and log each row to the console
*** Test Cases ***
Read CSV File
    ${data}=    Evaluate    __import__('csv').reader(open('C:/Users/Rakesh/Downloads/user.csv'))
    FOR    ${row}    IN    @{data}
        Log To Console    ${row}
    END

