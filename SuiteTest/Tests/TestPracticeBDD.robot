***Settings***
Documentation       Caso de teste criado no modelo BDD
Resource            ../Resources/Resource.robot

Suite Setup         Abrir navegador
Test Setup

Suite Teardown      Fechar navegador
Test Teardown

***Test Cases***
Cenário #1: Find valiable product
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultados de busca


Cenário #2: Find unvaliable product
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "ItemNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "ItemNãoExistente""


***Keywords***