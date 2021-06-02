***Settings***
Documentation           Learning about 'String Library'

Library                 String
Library                 OperatingSystem

***Test Cases***

Exemple 01: Dealing with lines of string text
    Counting lines
    Taking a specific line
    Taking a specific line that contains a word: "file 02"
    Picking up the marker

Exemple 02: Manipulating string
    Replacing value in text
    I want everything in tiny
    I want everything in capitals



***Keywords***
Taking file

    ${CONTEUDO_ARQUIVO}     Get File        ./expert/string/folder/file_text.txt
    [Return]        ${CONTEUDO_ARQUIVO}

Counting lines

    ${STRING}       Taking file
    ${LINHAS}       Get Line Count   ${STRING}
    Log             Meu arquivo tem: ${LINHAS} linhas!!!

Taking a specific line

    ${STRING}       Taking file
    ${LINHA_3}      Get Line        ${STRING}       3
    Log             Conteúdo da linha 03 do arquivo:\n"${LINHA_3}"
    FOR     ${NUMERO_LINHA}     IN RANGE    0   6
            ${CONTEUDO_LINHA}       Get Line        ${STRING}       ${NUMERO_LINHA}
            Log     Conteúdo da linha ${NUMERO_LINHA} do arquivo:\n"${CONTEUDO_LINHA}"
    END

Taking a specific line that contains a word: "${WORD}"

    ${STRING}       Taking file
    ${LINHA}        Get Lines Containing String     ${STRING}       ${WORD}
    Log             Linha om ${WORD}: \n"${LINHA}"

Picking up the marker

    ${STRING}       Taking file
    ${LINHA}        Get Line        ${STRING}       0
    ${COMECO}       Fetch From Left         ${LINHA}        0
    ${FIM}          Fetch From Right        ${LINHA}        file${SPACE}
    Log             Começo: "${COMECO}"\nFim:"${FIM}"\n\nTudo junto: "${COMECO}${FIM}"

Replacing value in text

    ${TEXTO}            Taking file
    ${NOVO_TEXTO}       Replace String      string=${TEXTO}         search_for=line in file     replace_with=line in file number
    Log                 O velho texto era assim:\n${TEXTO}\nO novo texto ficou assim:\n${NOVO_TEXTO}
    Create File         ./expert/string/folder/newFile_text.txt     ${NOVO_TEXTO}


I want everything in tiny

    ${TEXTO}            Taking file
    ${TEXTO}            Convert To Lowercase         ${TEXTO}
    Log                 Meu texto todo em minúsculo:\n${TEXTO}

I want everything in capitals

    ${TEXTO}            Taking file
    ${TEXTO}            Convert To Uppercase          ${TEXTO}
    Log                 Meu texto todo em maiúsculo:\n${TEXTO}