***Settings***

Documentation               FOR using several variables

***Test Cases***
Using FOR With Severals variables
    Create Translate Dictionary

***Keywords***
Create Translate Dictionary
    FOR     ${index}        ${english}      ${finnish}          ${portuguese}       IN
    ...         1               cat             kissa               gato
    ...         2               dog             koira               cachorro
    ...         3               horse           hevonen             cavalo
        Log     Animal ${index}:\nEm inglês: ${english}\nEm finlandês: ${finnish}\nEm português: ${portuguese}
    END