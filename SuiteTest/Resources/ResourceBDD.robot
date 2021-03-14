***Settings***
Documentation       Resources que será utilizado nas 2 suites de teste;
Library             SeleniumLibrary

***Variables***
${URL}              http://automationpractice.com/
${BROWSER}          chrome
#${PRODUTO}          Blouse

***Keywords***
#Setup e Teardown
Abrir navegador
    Open Browser            about:blank          ${BROWSER}


Fechar navegador
    Close Browser

### Passo-a-passp

Dado que estou na página home do site
    Go To                   ${URL}
    Title Should Be         My Store

Quando eu pesquisar pelo produto "${PRODUTO}" no campo de pesquisa
    Input Text              id=search_query_top      ${PRODUTO}
    #Clicar no botão pesquisar
    Click Element           name=submit_search

Então o produto "${PRODUTO}" deve ser listado na página de resultados de busca
    Wait Until Element Is Visible           css=#center_column > h1
    Title Should Be                         Search - My Store
    Page Should Contain Image               xpath=//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link                xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "Blouse")]

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible           xpath=//p[@class="alert alert-warning"]
    Element Text Should Be                  xpath=//p[@class="alert alert-warning"]         ${MENSAGEM_ALERTA}
    Close Browser