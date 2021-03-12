***Settings***
Documentation       Caso de teste criado no modelo BDD
Resource            ../Resources/ResourceBDD.robot

#Suite Setup         Abrir navegador
Test Setup          Abrir navegador

#Suite Teardown      Fechar navegador
Test Teardown       Fechar navegador

***Test Cases***
Cenário #1: Search for valiable product
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse" no campo de pesquisa
    Então o produto "Blouse" deve ser listado na página de resultados de busca


Cenário #2: Search for unvaliable product
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "ItemNãoExistente" no campo de pesquisa
    Então a página deve exibir a mensagem "No results were found for your search "ItemNãoExistente""
