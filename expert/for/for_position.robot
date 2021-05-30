***Settings***

Documentation               FOR printing position item on list

***Test Cases***
Test FOR With Enumerate Item On List
    For With Enumerate


***Keywords***
For With Enumerate
    FOR     ${index}        ${item}     IN ENUMERATE    P  M  G  GG  XG  XXG
        Log     Item in the list: ${item} - Item position on list: ${index}
    END 