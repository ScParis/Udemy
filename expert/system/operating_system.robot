***Settings***
Documentation           http://robotframework.org/robotframework/latest/libraries/OperatingSystem.html

Library                 OperatingSystem

***Test Cases***
Exemple 01: Creating files
    Test01: Creating text file
    Test02: Creating json file

Exemple 02: Copying files
    Test03: Copying files

Exemple 03: Reading files
    Test04: Reading the contents of a file      #this file contains a string data
    Test05: Reading binary from a file

Exemple 04: Delete files
    Test06: List directory
    Test:07 Delete files        file_json.json
    Test:07 Delete files        file_text.txt
    Test:07 Delete files        file_pdf.pdf
    Test06: List directory

***Keywords***
Test01: Creating text file
    Create File         ./expert/system/files/file_text.txt             Esse curso vai me tornar um ninja em RobotFramework!!!
    Create File         ./expert/system/files/file_pdf.pdf              Esse curso vai me tornar um ninja em RobotFramework!!!

Test02: Creating json file
    Create File         ./expert/system/files/file_json.json          {"name": "Here is the name", "date": "31/05/20212", "list":[1,2,3]}
    
Test03: Copying files
    Create Directory        ./expert/system/files/copy/
    Copy File               ./expert/system/files/file_text.txt         ./expert/system/files/copy/
    Copy File               ./expert/system/files/file_json.json        ./expert/system/files/copy/
    Copy File               ./expert/system/files/file_pdf.pdf          ./expert/system/files/copy/

Test04: Reading the contents of a file
    #this file contains string data, as a .txt file
    ${MEU_ARQUIVO}          Get File                ./expert/system/files/copy/file_text.txt
    ${SIZE}                 Get File Size           ./expert/system/files/copy/file_text.txt
    Log     ${MEU_ARQUIVO}

Test05: Reading binary from a file
    #this file contains binary data, such as a .json file
    Should Exist            ./expert/system/files/copy/file_pdf.pdf                 msg=O Arquivo não existe!! Verifique!
    ${MEU_ARQUIVO}          Get Binary File                ./expert/system/files/copy/file_pdf.pdf
    ${SIZE}                 Get File Size                  ./expert/system/files/copy/file_pdf.pdf
    Log     ${MEU_ARQUIVO}

Test06: List directory
    List Directory          ./expert/system/files

Test:07 Delete files
    [Arguments]             ${ARQUIVO}
    Remove File             ./expert/system/files/${ARQUIVO}
