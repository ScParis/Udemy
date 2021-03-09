***Settings***
Documentation       Caso de teste criado no modelo procedural
Resource            ../Resources/Resource.robot

#Suite Setup         Abrir navegador
Test Setup          Abrir navegador

#Suite Teardown      Fechar navegador
Test Teardown       Fechar navegador

***Test Cases***
Test Case #1: Find valiable product
    Acessar a página home do site
    Conferir se a página home foi exibida
    Digitar o nome do produto "Blouse" 
    Clicar no botão pesquisar
    Conferir se o procuto "Blouse" foi listado no site

Test Case #2: Find unvaliable product
    Acessar a página home do site
    Conferir se a página home foi exibida
    Digitar o nome do produto "ItemNãoExistente" 
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""



***Keywords***