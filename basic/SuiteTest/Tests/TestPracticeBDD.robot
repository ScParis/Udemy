***Settings***
Documentation       Caso de teste criado no modelo BDD

Resource            ../Resources/ResourceBDD.robot

Suite Setup         Abrir navegador
# Test Setup          Abrir navegador

Suite Teardown      Fechar navegador


***Test Cases***
Cenário #1: Search for valiable product
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse" no campo de pesquisa
    Então o produto "Blouse" deve ser listado na página de resultados de busca

Cenário #2: Search for unvaliable product
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "ItemNãoExistente" no campo de pesquisa
    Então a página deve exibir a mensagem "No results were found for your search "ItemNãoExistente""


***Keywords***

Dado que estou na página home do site
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}" no campo de pesquisa
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultados de busca
    Conferir Se O Produto "${PRODUTO}" Foi Listado No Site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir Mensagem De Erro "${MENSAGEM_ALERTA}"
