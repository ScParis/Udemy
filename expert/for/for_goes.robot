***Settings***

Documentation               FOR scrolling through a list

***Test Cases***
Test With More Options 'IN RANGE'
    Traditional
    Just The Number Of Loops Reported (upper limit)
    Arithmetic
    Specific Intervals


***Keywords***
Traditional

    [Documentation]         Range from 1 to 10
    FOR     ${index}        IN RANGE    1   11
        Log     ${index}
    END

Just The Number Of Loops Reported (upper limit)

    [Documentation]         Range from 0 to 10
    FOR     ${index}        IN RANGE    10
        Log     ${index}
    END

Arithmetic

    [Documentation]         Range from 0 to 5
    
    ${var}     Set Variable        ${5}
    FOR     ${index}        IN RANGE        ${var} + 1
        Log     ${index}
    END
    
Specific Intervals

    [Documentation]             Range from 0 to 30, jumping 5 to 5
    FOR     ${index}        IN RANGE        0       31      5
        Log     ${index}
    END