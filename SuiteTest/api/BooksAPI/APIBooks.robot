***Settings***
Documentation           Documentação da API: https://fakerestapi.azurewebsites.net/index.html


Resource                ../resources/resourcesAPI.robot

Suite Setup             Conectar a minha API

***Test Cases***
Buscar a listagem de todos os livros (GET em todos os livros)
    
    Requisitar todos os livros
    Conferir status code            200
    Conferir o reason               OK
    Conferir se retorna uma lista com "200" livros

Buscar um livro específico (GET em um livro específico)
    Requisitar o livro com ID: "15"
    Conferir status code            200
    Conferir o reason               OK
    Conferir se retorna todos os dados corretos do livro 15

Criar um livro (POST de um livro)
    [Tags]          post
    Cadastro de um livro
    Conferir status code            200
    Conferir o reason               OK
    Conferir se retorna todos os dados cadastrados do livro "201"

Atualizando um livro (PUT de um livro)
    [Tags]          put
    Atualizando um livro com ID: "400"
    Conferir status code            200
    Conferir o reason               OK
    Conferir se retorna todos os dados alterados do livro "400"

Deletando um livro (DELETE de um livro)
    [Tags]          del
    Deletando um livro: ID "500"
    Conferir status code            200
    Conferir o reason               OK
    Conferir se o livro com ID "500" foi excluído
