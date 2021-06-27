***Settings***
Documentation       Exemplos da própria Library: https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot
...                 Doc da API do GitHub: https://developer.github.com/v3/

Library             RequestsLibrary
Library             Collections

Resource            ../resources/variables/variables.robot
Resource            ../resources/base.robot

***Test Cases***
Exemplo: Fazendo autenticação básica (Basic Authentication)
    Conectar com autenticação básica na API do GitHub

Exemplo: Usando autenficação com token
    Conectar com autenticação por token na API do GitHub
    Solicitar os dados do meu usuário

Exemplo: Usando parâmetros
    Conectar na API do GitHub sem autenticação
    Pesquisar issues com o state "open" e com o label "bug"

Exemplo: Usando headers
    # Conectar com autenticação básica na API do GitHub
    Conectar com autenticação por token na API do GitHub
    Enviar a reação "laugh" para a issue "8"