***Settings***
Documentation       Caso de teste criado no modelo procedural
Resource            ../Resources/Resource.robot

#Suite Setup         Abrir navegador
Test Setup          Abrir navegador

#Suite Teardown      Fechar navegador
Test Teardown       Fechar navegador

***Test Cases***
Test Case #1: Pesquisar Produtos Existentes
    Acessar a página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o procuto "Blouse" foi listado no site

Test Case #2: Pesquisar Produtos não Existentes
    Acessar a página home do site
    Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""

Test Case #4: Listar Produtos
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
#    Clicar na sub categoria "Summer Dresses"
