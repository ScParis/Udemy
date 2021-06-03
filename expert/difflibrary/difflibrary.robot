*** Settings ***
Documentation         https://marketsquare.github.io/robotframework-difflibrary/
Library               DiffLibrary

*** Test Cases ***

Test 1: compare if 2 files are the same
    Compare Files        expert/difflibrary/01_file.txt    expert/difflibrary/01_file.txt

Test 2: compare if 2 files are different
    Compare Files        expert/difflibrary/01_file.txt    expert/difflibrary/02_file.txt

*** Keywords ***

Compare Files
    [Arguments]           ${arquivo1}    ${arquivo2}
    Diff Files            ${arquivo1}    ${arquivo2}        fail=False