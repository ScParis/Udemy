***Settings***
Documentation           Documentação da API: https://fakerestapi.azurewebsites.net/index.html

Library               RequestsLibrary
Library               Collections
Library               BuiltIn

***Variables***
${URL_API}              https://fakerestapi.azurewebsites.net/api/v1
&{BOOK_15}              ID=15
...                     Title=Book 15
...                     PageCount=1500

&{BOOK_201}             id=201
...                     title=API_BOOK
...                     description=Test POST a book
...                     pageCount=150
...                     excerpt=string
...                     publishDate=2021-05-24T00:10:32.091Z

&{BOOK_400}             id=400
...                     title=300 e um pouco mais
...                     description=string
...                     pageCount=300
...                     excerpt=string
...                     publishDate=2021-05-24T01:46:38.442Z


***Keywords***
###     SETUP & TEARDOWN    ###

Conectar a minha API
    Create Session      fakeAPI     ${URL_API}

###     AÇÕES     ###

Requisitar todos os livros

    ${RESPOSTA}     GET On Session         fakeAPI     Books
    Log             ${RESPOSTA.text}
    Set Test Variable           ${RESPOSTA}

Requisitar o livro com ID: "${ID_LIVRO}"

    ${RESPOSTA}     GET On Session         fakeAPI     Books/${ID_LIVRO}
    Log             ${RESPOSTA.text}
    Set Test Variable           ${RESPOSTA}

Cadastro de um livro
    
    ${HEADERS}       Create Dictionary           content-type=application/problem+json

    ${RESPOSTA}    Post Request   fakeAPI    Books
    ...                           data={"ID":${BOOK_201.id},"Title": "${BOOK_201.title}","Description": "${BOOK_201.description}","PageCount": ${BOOK_201.pageCount},"Excerpt": "${BOOK_201.excerpt}","PublishDate": "${BOOK_201.publishDate}"}
    ...                           headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Atualizando um livro com ID: "${ID_LIVRO}"

    ${HEADERS}       Create Dictionary           content-type=application/problem+json

    ${RESPOSTA}    Put Request    fakeAPI    Books/${ID_LIVRO}
    ...                           data={"ID": ${BOOK_400.id},"Title": "${BOOK_400.title}","Description": "${BOOK_400.description}","PageCount": ${BOOK_400.pageCount},"Excerpt": "${BOOK_400.excerpt}","PublishDate": "${BOOK_400.publishDate}"}
    ...                           headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Deletando um livro: ID "${ID_LIVRO}"

    ${RESPOSTA}     DELETE On Session         fakeAPI     Books/${ID_LIVRO}
    Log             ${RESPOSTA.text}
    Set Test Variable           ${RESPOSTA}



###     CONFERÊNCIAS     ###

Conferir status code

    [Arguments]         ${SATUSCODE_DESEJADO}
    Should Be Equal As Strings          ${RESPOSTA.status_code}         ${SATUSCODE_DESEJADO}

Conferir o reason

    [Arguments]         ${REASON_DESEJADO}
    Should Be Equal As Strings           ${RESPOSTA.reason}          ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QNT_LIVROS}" livros

    Length Should Be        ${RESPOSTA.json()}          ${QNT_LIVROS}

Conferir se retorna todos os dados corretos do livro 15

    Dictionary Should Contain Item          ${RESPOSTA.json()}        id                ${BOOK_15.ID}
    Dictionary Should Contain Item          ${RESPOSTA.json()}        title             ${BOOK_15.Title}
    Dictionary Should Contain Item          ${RESPOSTA.json()}        pageCount         ${BOOK_15.PageCount}
    Should Not Be Empty                     ${RESPOSTA.json()["description"]}
    Should Not Be Empty                     ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty                     ${RESPOSTA.json()["publishDate"]}

Conferir se retorna todos os dados cadastrados do livro "${ID_LIVRO}"
    Conferir livro    ${ID_LIVRO}

Conferir se retorna todos os dados alterados do livro "${ID_LIVRO}"
    Conferir livro    ${ID_LIVRO}

Conferir livro
    [Arguments]     ${ID_LIVRO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id              ${BOOK_${ID_LIVRO}.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title           ${BOOK_${ID_LIVRO}.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description     ${BOOK_${ID_LIVRO}.description}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount       ${BOOK_${ID_LIVRO}.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt         ${BOOK_${ID_LIVRO}.excerpt}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate     ${BOOK_${ID_LIVRO}.publishDate}


Conferir se o livro com ID "${ID_LIVRO}" foi excluído
    BuiltIn.Should Be Empty         ${RESPOSTA.content}