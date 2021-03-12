***Settings***
Documentation       Caso de teste criado no modelo procedural
Resource            ../Resources/Resource.robot

#Suite Setup         Abrir navegador
Test Setup          Abrir navegador

#Suite Teardown      Fechar navegador
Test Teardown       Fechar navegador

***Test Cases***
Test Case #1: Search for valiable product
    Acessar a página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o procuto "Blouse" foi listado no site

Test Case #2: Search for unvaliable product
    Acessar a página home do site
    Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""
