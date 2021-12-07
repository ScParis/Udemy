*** Settings ***
Library    SeleniumLibrary 

# Test Teardown       Take Screenshot
*** Variables ***
${BROWSER}      chrome
${URL}          https://www.amazon.com.br/

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    SeleniumLibrary.Open Browser    about:blank   ${BROWSER}
    # ...   options=add_argument("--headless")

Fechar navegador
    SeleniumLibrary.Close Browser

#### Ações
Acessar a página home do site
    SeleniumLibrary.Go To               ${URL}
    Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text          name=search_query    ${PRODUTO}

Clicar no botão pesquisar
    Click Element       name=submit_search

#### Conferências
Conferir Se O Produto "${PRODUTO}" Foi Listado No Site
    Wait Until Element Is Visible   css=#center_column > h1
    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src='${URL}/img/p/7/7-home_default.jpg']
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]
    

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}


