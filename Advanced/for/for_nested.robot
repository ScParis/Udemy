***Settings***

Documentation               FOR representation in robot

***Test Cases***
Suite About FOR in the Robot Framework
    Create product registration (FOR nested)

***Keywords***
Create product registration (FOR nested)
    FOR     ${product}      IN      baby look   camiseta    blusa
        Print Size For Products         ${product}
    END

Print Size For Products

    [Arguments]         ${product}
    FOR         ${size}      IN     P       M       G
        Log         Product: ${product} - Size: ${size}
    END