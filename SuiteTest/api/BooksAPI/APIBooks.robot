***Settings***
Documentation           Documentação da API: https://fakerestapi.azurewebsites.net/index.html


Resource                ../resources/resourcesAPI.robot

Suite Setup             Conectar a minha API

***Test Cases***
Buscar a listagem de todos os livros (GET em todos os livros)
    
    Requisitar todos os livros
    Conferir se retorna uma lista com 200 livros