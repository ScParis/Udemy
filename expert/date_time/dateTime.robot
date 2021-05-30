***Settings***

Documentation           Using DateTime library
Library                 DateTime

***Test Cases***
Example 1: Taking the current date and time
    Test#1: Taking Current Date
    Test#2: Taking Current Date And Time
    Test#3: Taking Day, Month, Year Separately
    Test#4: Working With Time




***Keywords***
Test#1: Taking Current Date

    ${AGORA}        Get Current Date        result_format=%d-%m-%Y
    Log             ${AGORA}

Test#2: Taking Current Date And Time

    ${AGORA}        Get Current Date        result_format=%d/%m/%Y - T%H:%M:%S
    Log             ${AGORA}

Test#3: Taking Day, Month, Year Separately

    ${HOJE}         Get Current Date
    ${HOJE}         Convert Date        ${HOJE}     datetime
    Log             ${HOJE.day}
    Log             ${HOJE.month}
    Log             ${HOJE.year}

Test#4: Working With Time

    ${HORA}     Convert Time        1 minute 30 seconds
    Log         São ${HORA} segundos em 1 minuto e 30 segundos!

    ${HORA}     Convert Time        5400        verbose
    Log         5400 segundos é ${HORA}

    ${HORA}     Convert Time        5500    timer        exclude_millis=yes
    Log         5500 segundos é ${HORA}