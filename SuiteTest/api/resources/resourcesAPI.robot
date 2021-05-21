***Settings***
Documentation           Documentação da API: https://fakerestapi.azurewebsites.net/index.html

Library                 RequestsLibrary
Library                 Collections
# Library                 BuiltIn

***Variables***
${URL_API}                  https://fakerestapi.azurewebsites.net/api/v1


***Keywords***
###     SETUP & TEARDOWN    ###

Conectar a minha API
    Create Session      fakeAPI     ${URL_API}

###     AÇÕES     ###

Requisitar todos os livros

    ${RESPOSTA}     GET On Session         fakeAPI     Books
    Log             ${RESPOSTA.text}

# Conferir status code

#     [Arguments]         ${STATUS_CODE}
#     Should Be Equal As Strings          ${RESPOSTA.status_code}         ${STATUS_CODE}